import {
  Controller,
  UseGuards,
  Get,
  Post,
  Put,
  Body,
  HttpException,
  HttpStatus,
  Param,
  Delete,
} from '@nestjs/common';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { CreateProductDto } from './dto/create-product.dto';
import { ApiBody, ApiBearerAuth, ApiTags, ApiParam } from '@nestjs/swagger';
import { HttpErrorByCode } from '@nestjs/common/utils/http-error-by-code.util';
import { Product } from '../models/product.model';

@ApiTags('Product')
@Controller('product')
export class ProductController {
  @ApiBearerAuth()
  @Get()
  async getAllProducts() {
    const products = await Product.findAll({
      attributes: ['name', 'brandName', 'price', 'imgUrl', 'stock'],
    });

    return products;
  }

  @UseGuards(JwtAuthGuard)
  @Get(':productId')
  @ApiParam({ name: 'productId' })
  async getProductById(@Param('productId') productId: string) {
    const product = await Product.findOne({
      where: { id: productId },
      attributes: ['name', 'brandName', 'price', 'imgUrl'],
    });

    if (!product) {
      throw new HttpException('Product not found', HttpStatus.NOT_FOUND);
    }

    return product;
  }

  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Post()
  @ApiBody({ type: CreateProductDto })
  async createProduct(@Body() createProductDto: CreateProductDto) {
    const isProductExist = await Product.findOne({
      where: { name: createProductDto.name },
    });

    if (isProductExist) {
      throw new HttpErrorByCode[HttpStatus.BAD_REQUEST]();
    }

    await Product.upsert({
      name: createProductDto.name,
      brandName: createProductDto.brandName,
      price: createProductDto.price,
      imgUrl: createProductDto.imgUrl,
      stock: createProductDto.stock,
    });

    return HttpStatus.CREATED;
  }

  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Put(':productId')
  @ApiBody({ type: CreateProductDto })
  @ApiParam({ name: 'productId' })
  async updateProduct(
    @Body() createProductDto: CreateProductDto,
    @Param('productId') productId,
  ) {
    const product = await Product.findOne({
      where: { id: productId },
    });

    if (!product) {
      throw new HttpErrorByCode[HttpStatus.BAD_REQUEST](
        "Product doesn't exist",
      );
    }

    product.name = createProductDto.name;
    product.brandName = createProductDto.brandName;
    product.price = createProductDto.price;
    product.imgUrl = createProductDto.imgUrl;

    await product.save();

    return HttpStatus.CREATED;
  }

  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Delete(':productId')
  async deleteProductById(@Param() productId) {
    const product = await Product.findOne({
      where: { id: productId },
    });

    if (!product) {
      throw new HttpErrorByCode[HttpStatus.BAD_REQUEST](
        "Product doesn't exist",
      );
    }

    await product.destroy();

    return HttpStatus.OK;
  }
}
