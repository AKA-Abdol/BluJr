import { Card, User, UserType } from '../user.schema';

export class TypeUser {
  id: string;
  firstName: string;
  lastName: string;
  wallet: number;
  card: Card;
  type: UserType;
}

export abstract class UserDao {
  static convertOne = (user: MongoDoc<User>): TypeUser => ({
    id: user._id.toString(),
    card: user.card,
    firstName: user.firstName,
    lastName: user.lastName,
    wallet: user.wallet,
    type: user.parentId === null ? UserType.PARENT : UserType.CHILD,
  });
}
