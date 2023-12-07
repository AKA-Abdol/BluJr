import { Module } from '@nestjs/common';
import { TransactionRepo } from './transaction.repo';
import { TransactionService } from './transaction.service';
import { MongooseModule } from '@nestjs/mongoose';
import { Transaction, TransactionSchema } from './transaction.schema';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Transaction.name, schema: TransactionSchema },
    ]),
  ],
  providers: [TransactionRepo, TransactionService],
  exports: [TransactionService],
})
export class TransactionModule {}
