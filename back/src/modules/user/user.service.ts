import {
  BadRequestException,
  Injectable,
  InternalServerErrorException,
  NotFoundException,
} from '@nestjs/common';
import { UserRepo } from './user.repo';
import { Card, User } from './user.schema';
import mongoose from 'mongoose';
import { UserDao } from './daos/user.dao';
import { InCreateChildBodyDto } from './dtos/in-create-child.dto';
import { InjectConnection } from '@nestjs/mongoose';
import { TransactionService } from '../transaction/transaction.service';
import { InTransferDto } from './dtos/in-transfer.dto';
import { TransactionType } from '../transaction/transaction.schema';
import { Cron, CronExpression } from '@nestjs/schedule';

@Injectable()
export class UserService {
  constructor(
    private readonly userRepo: UserRepo,
    private readonly transactionService: TransactionService,
    @InjectConnection() private readonly connection: mongoose.Connection,
  ) {}

  private isParent(user: MongoDoc<User>): boolean {
    return user.parentId === null;
  }

  private hasCredit(user: MongoDoc<User>, amount: number): boolean {
    return user.wallet > amount;
  }

  private generateCardNumber(): string {
    return `62198619${Math.floor(1000_0000 + 9000_0000 * Math.random())}`;
  }

  private generateCVV2(): number {
    return Math.floor(100 + 900 * Math.random());
  }

  private generateExpirationDate(): Date {
    return new Date(new Date().setFullYear(new Date().getFullYear() + 4));
  }

  private generateNewCard(): Card {
    return {
      cardNo: this.generateCardNumber(),
      cvv2: this.generateCVV2(),
      expiresAt: this.generateExpirationDate(),
    };
  }

  async getProfile(userId: string) {
    const user = await this.userRepo.getById(
      new mongoose.Types.ObjectId(userId),
    );

    if (user === null) throw new NotFoundException('کاربر یافت نشد');

    return UserDao.convertOne(user);
  }

  async createChild(parentId: string, input: InCreateChildBodyDto) {
    if (!input.initialWallet) input.initialWallet = 0;
    if (!input.weekly) input.weekly = 0;
    const parent = await this.userRepo.getById(
      new mongoose.Types.ObjectId(parentId),
    );
    if (parent === null) throw new NotFoundException('کاربر یافت نشد');
    if (!this.isParent(parent))
      throw new BadRequestException('فقط والد می تواند فرزند اضافه کند');
    if (!this.hasCredit(parent, input.initialWallet))
      throw new BadRequestException('موجودی کافی نیست');

    const transactionSession = await this.connection.startSession();
    transactionSession.startTransaction();
    try {
      const child = await this.userRepo.create({
        firstName: input.firstName,
        lastName: input.lastName,
        wallet: input.initialWallet,
        card: this.generateNewCard(),
        parentId: parent._id,
        weekly: input.weekly,
      });
      if (input.initialWallet) {
        await this.userRepo.updateWalletBy(
          parent._id,
          -1 * input.initialWallet,
        );
        await this.transactionService.transfer(
          parent._id,
          child._id,
          input.initialWallet,
        );
      }

      await transactionSession.commitTransaction();
      return UserDao.convertOne(child);
    } catch (error) {
      transactionSession.abortTransaction();
      throw new InternalServerErrorException('خطای سرور');
    } finally {
      await transactionSession.endSession();
    }
  }

  async getChildren(parentId: string) {
    const parent = await this.userRepo.getById(
      new mongoose.Types.ObjectId(parentId),
    );
    if (parent === null) throw new NotFoundException('والد یافت نشد');
    const children = await this.userRepo.getChildrenByParentId(
      new mongoose.Types.ObjectId(parentId),
    );
    return children.map(UserDao.convertOne);
  }

  async getTransactions(userId: string) {
    const trs = await this.transactionService.getTransactions(
      new mongoose.Types.ObjectId(userId),
    );
    const tos = await Promise.all(
      trs.map((tr) => this.userRepo.getById(tr.to)),
    );
    return trs.map((tr, index) => ({
      ...tr,
      toName: `${tos[index].firstName} ${tos[index].lastName}`,
    }));
  }

  async canChildTransfer(child: MongoDoc<User>, to: MongoDoc<User>) {
    return child.parentId.equals(to._id) || child.parentId.equals(to.parentId);
  }

  private async walletTransfer(
    from: mongoose.Types.ObjectId,
    to: mongoose.Types.ObjectId,
    amount: number,
    reason: TransactionType = TransactionType.TRANSFER,
  ) {
    const transactionSession = await this.connection.startSession();
    transactionSession.startTransaction();
    try {
      await this.userRepo.updateWalletBy(from, -amount);
      await this.userRepo.updateWalletBy(to, amount);

      const tr = await this.transactionService.transfer(
        from,
        to,
        amount,
        reason,
      );

      await transactionSession.commitTransaction();
      return tr;
    } catch (error) {
      transactionSession.abortTransaction();
      throw new InternalServerErrorException('خطای سرور');
    } finally {
      await transactionSession.endSession();
    }
  }

  async transfer(userId: string, input: InTransferDto, toId: string) {
    const from = await this.userRepo.getById(
      new mongoose.Types.ObjectId(userId),
    );

    if (!this.hasCredit(from, input.amount))
      throw new BadRequestException('موجودی کافی نیست');

    const to = await this.userRepo.getById(new mongoose.Types.ObjectId(toId));

    if (this.isParent(from))
      return this.walletTransfer(from._id, to._id, input.amount);
    if (this.canChildTransfer(from, to))
      return this.walletTransfer(from._id, to._id, input.amount);
    else
      throw new BadRequestException(
        'فرزند فقط می تواند به والد یا برادران یا خواهران انتقال دهد',
      );
  }

  @Cron(CronExpression.EVERY_5_MINUTES)
  async payWeekly() {
    const children = await this.userRepo.getChildrenHasWeekly();
    Promise.all(
      children.map(
        (child) =>
          child.isWeeklyActive &&
          this.walletTransfer(
            child.parentId,
            child._id,
            child.weekly,
            TransactionType.WEEKLY,
          ),
      ),
    );
  }
}
