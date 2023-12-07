import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { UserModule } from './modules/user/user.module';
import { TransactionModule } from './modules/transaction/transaction.module';

@Module({
  imports: [
    MongooseModule.forRoot('mongodb://localhost:27017/khorsand87'),
    UserModule,
    TransactionModule,
  ],
})
export class AppModule {}
