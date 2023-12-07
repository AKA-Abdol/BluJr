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
    const children = await this.userRepo.getChildren(
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
}
