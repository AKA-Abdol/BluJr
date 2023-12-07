import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { User } from './user.schema';
import mongoose, { Model } from 'mongoose';

@Injectable()
export class UserRepo {
  constructor(@InjectModel(User.name) private model: Model<User>) {}

  async getById(_id: mongoose.Types.ObjectId) {
    return this.model.findOne({ _id });
  }

  async create(user: User): Promise<MongoDoc<User>> {
    return this.model.create(user);
  }

  async updateWalletBy(
    _id: mongoose.Types.ObjectId,
    amount: number,
  ): Promise<MongoDoc<User>> {
    const user = await this.model.findOne({ _id });
    user.wallet += amount;
    user.save();
    return user;
  }

  async getChildrenByParentId(
    parentId: mongoose.Types.ObjectId,
  ): Promise<MongoDoc<User>[]> {
    return this.model.find({ parentId }).exec();
  }

  async getChildrenHasWeekly(): Promise<MongoDoc<User>[]> {
    return this.model.find({
      parentId: { $exists: 1 },
      weekly: { $gt: 0 },
    });
  }
}
