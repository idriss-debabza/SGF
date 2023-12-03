import { IsNotEmpty, IsArray, IsEnum } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreatePurchaseDto {
  @ApiProperty({
    example: [
      'e7f5da7b-f2da-41c9-9c6a-107322905f65',
      'e7f5da7b-f2da-41c9-9c6a-107322905f65',
    ],
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
