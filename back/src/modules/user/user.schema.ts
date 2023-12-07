import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import mongoose from 'mongoose';

export class Card {
  cardNo: string;
  cvv2: number;
  expiresAt: Date;
}

export enum UserType {
  PARENT = 'Parent',
  CHILD = 'Child',
}

@Schema()
export class User {
  @Prop({ default: null })
  parentId?: mongoose.Types.ObjectId;

  @Prop()
  firstName: string;

  @Prop()
  lastName: string;

  @Prop({ default: 0 })
  wallet: number;

  @Prop()
  card: Card;

  @Prop()
  weekly?: number;

  @Prop({ default: true })
  isWeeklyActive?: boolean;
}

export const UserSchema = SchemaFactory.createForClass(User);
