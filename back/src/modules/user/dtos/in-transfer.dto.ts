import { IsNumber, IsPositive, IsString } from 'class-validator';

export class InTransferDto {
  @IsNumber()
  @IsPositive()
  amount: number;
}

export class InTransferParamDto {
  @IsString()
  id: string;
}
