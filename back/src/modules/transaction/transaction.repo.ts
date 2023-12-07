import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Transaction } from './transaction.schema';
import mongoose, { Model } from 'mongoose';

@Injectable()
export class TransactionRepo {
  constructor(
    @InjectModel(Transaction.name) private model: Model<Transaction>,
  ) {}

  async create(transaction: Transaction): Promise<MongoDoc<Transaction>> {
    return this.model.create(transaction);
  }

  async getDepositById(
    from: mongoose.Types.ObjectId,
  ): Promise<MongoDoc<Transaction>[]> {
    return this.model.find({ from });
  }

  async getReceiveById(
    to: mongoose.Types.ObjectId,
  ): Promise<MongoDoc<Transaction>[]> {
    return this.model.find({ to });
  }

  async getAllByUserId(
    userId: mongoose.Types.ObjectId,
  ): Promise<MongoDoc<Transaction>[]> {
    return this.model
      .find({ $or: [{ from: userId }, { to: userId }] })
      .sort({ createdAt: -1 });
  }
}
