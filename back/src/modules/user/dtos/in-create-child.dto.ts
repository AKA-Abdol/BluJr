import { IsNumber, IsOptional, IsString, Min } from 'class-validator';

export class InCreateChildBodyDto {
  @IsString()
  firstName: string;

  @IsString()
  lastName: string;

  @IsOptional()
  @IsNumber()
  @Min(0)
  initialWallet: number;
}
