import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';

export enum TransactionType {
  TRANSFER = 'Transfer',
  WEEKLY = 'Weekly',
}

@Schema({ timestamps: true })
export class Transaction {
  @Prop()
  from: mongoose.Types.ObjectId;

  @Prop()
  to: mongoose.Types.ObjectId;

  @Prop()
  amount: number;

  @Prop()
  type: TransactionType;

  @Prop()
  createdAt?: Date;

  @Prop()
  updatedAt?: Date;
}

export const TransactionSchema = SchemaFactory.createForClass(Transaction);
