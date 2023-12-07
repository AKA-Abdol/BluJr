import { Type } from 'class-transformer';
import { IsNumber, IsOptional } from 'class-validator';

export abstract class InPaginationDto {
  @Type(() => Number)
  @IsNumber()
  @IsOptional()
  page: number = 1;

  @Type(() => Number)
  @IsNumber()
  @IsOptional()
  perPage: number = 10;
}
