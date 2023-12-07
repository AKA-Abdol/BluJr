import { Injectable, InternalServerErrorException } from '@nestjs/common';
import { TransactionRepo } from './transaction.repo';
import mongoose from 'mongoose';
import { TransactionType } from './transaction.schema';
import {
  OutGetTransactionsItemDto,
  TransactionDtoType,
} from './dtos/out-get-transactions.dto';

@Injectable()
export class TransactionService {
  constructor(private readonly transactionRepo: TransactionRepo) {}

  async transfer(
    from: mongoose.Types.ObjectId,
    to: mongoose.Types.ObjectId,
    amount: number,
  ) {
    const transaction = await this.transactionRepo.create({
      from: new mongoose.Types.ObjectId(from),
      to: new mongoose.Types.ObjectId(to),
      amount: amount,
      type: TransactionType.TRANSFER,
    });
    if (transaction === null)
      throw new InternalServerErrorException('خطای سرور');
  }

  async getDeposit(userId: mongoose.Types.ObjectId) {
    return this.transactionRepo.getDepositById(userId);
  }

  async getReceive(userId: mongoose.Types.ObjectId) {
    return this.transactionRepo.getReceiveById(userId);
  }

  async getTransactions(
    userId: mongoose.Types.ObjectId,
  ): Promise<OutGetTransactionsItemDto[]> {
    const transactions = await this.transactionRepo.getAllByUserId(userId);
    return transactions.map((tr) => ({
      type: userId.equals(tr.from)
        ? TransactionDtoType.DEPOSIT
        : TransactionDtoType.RECEIVE,
      amount: tr.amount,
      createdAt: tr.createdAt,
      reason: tr.type,
      to: userId.equals(tr.from) ? tr.to : tr.from,
    }));
  }
}
