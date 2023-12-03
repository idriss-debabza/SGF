import { IsNotEmpty, IsString, IsNumber, IsUrl } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateProductDto {
  @ApiProperty({
    example:
      'TOSHIBA Smart HD LED TV 32" - 32L5650VJ Free Bracket TV - Hitam - Khusus Jabodetabek',
  })
  @IsNotEmpty()
  @IsString()
  public name: string;

  @ApiProperty({ example: 'Toshiba' })
  @IsNotEmpty()
  @IsString()
  public brandName: string;

  @ApiProperty({ example: 119 })
  @IsNumber()
  public price: number;

  @ApiProperty({
    example:
      'https://images.tokopedia.net/img/cache/700/product-1/2020/2/24/batch-upload/batch-upload_545cbcd4-be5b-481d-b8cc-88f20deb5037.png',
  })
  @IsUrl()
  public imgUrl: string;

  @ApiProperty({
    example: 10,
  })
  @IsNumber()
  public stock: number;

  constructor(name: string, brandName: string, price: number, imgUrl: string) {
    this.name = name;
    this.brandName = brandName;
    this.price = price;
    this.imgUrl = imgUrl;
  }
}
