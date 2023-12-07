import mongoose from 'mongoose';
import { TransactionType } from '../transaction.schema';

export enum TransactionDtoType {
  DEPOSIT = 'Deposit',
  RECEIVE = 'Receive',
}

export class OutGetTransactionsItemDto {
  to: mongoose.Types.ObjectId;

  amount: number;

  reason: TransactionType;

  type: TransactionDtoType;

  createdAt: Date;
}
