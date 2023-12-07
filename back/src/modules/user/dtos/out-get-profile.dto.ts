enum ValueEnum {
  HASAN = 'hasan',
  HOSSEIN = 'hossein',
}
export class OutGetProfileDto {
  firstName: string;
  lastName: string;
  wallet: number;
  value?: ValueEnum;
}
