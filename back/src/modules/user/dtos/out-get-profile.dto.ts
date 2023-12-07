import { Card, UserType } from '../user.schema';

export class OutGetProfileDto {
  firstName: string;
  lastName: string;
  type: UserType;
  card: Card;
}
