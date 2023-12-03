import { IsNotEmpty, IsArray, IsEnum } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreatePurchaseDto {
  @ApiProperty({
    example: [],
  })
  @IsNotEmpty()
  @IsArray()
  public productIds: string[];

  @ApiProperty({
    example: 'Gagne',
  })
  @IsNotEmpty()
  @IsEnum(['Gagne', 'Utilise'])
  public operationType: string;

  constructor(productIds: string[], operationType: string) {
    this.operationType = operationType;
    this.productIds = productIds;
  }
}
