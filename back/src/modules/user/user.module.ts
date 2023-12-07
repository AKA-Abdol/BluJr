import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { User, UserSchema } from './user.schema';
import { UserService } from './user.service';
import { UserRepo } from './user.repo';
import { UserController } from './user.controller';
import { TransactionModule } from '../transaction/transaction.module';

@Module({
  imports: [
    MongooseModule.forFeature([{ name: User.name, schema: UserSchema }]),
    TransactionModule,
  ],
  providers: [UserRepo, UserService],
  controllers: [UserController],
  exports: [UserService],
})
export class UserModule {}
