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
import { CreatePurchaseDto } from './dto/create-purchase.dto';
import { ApiBody, ApiBearerAuth, ApiTags, ApiParam } from '@nestjs/swagger';
import { HttpErrorByCode } from '@nestjs/common/utils/http-error-by-code.util';
import { Product } from '../models/product.model';
import { PurchaseProduct } from 'src/models/purchaseProduct.model';
import { UserId } from 'src/auth/decorators/user-id.decorator';
import { Purchase } from 'src/models/purchase.model';

@ApiTags('Purchase Product')
@Controller('purchase')
export class PurchaseController {
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Get()
  async getAllPurchase(@UserId() userId: string) {
    const purchases = PurchaseProduct.findAll({
      where: { id: userId },
      // attributes: ['id', 'purchaseId', 'productId'], // a revoir
    });

    return purchases;
  }

  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Get(':purchaseId')
  @ApiParam({ name: 'purchaseId' })
  async getPurchaseById(@Param() purchaseId) {
    //faut recuperer l'utilisateur tout d'abord et voir s'il a le droit de voir cette commande

    const purchase = await PurchaseProduct.findOne({
      where: { id: purchaseId }, //a revoir
    });

    if (!purchase) {
      throw new HttpException('Purchase not found', HttpStatus.NOT_FOUND);
    }

    return purchase;
  }

  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Post()
  @ApiBody({ type: CreatePurchaseDto })
  async createProduct(
    @Body() createPurchaseDto: CreatePurchaseDto,
    @UserId() userId: string,
  ) {
    const purch = await Purchase.upsert({
      typeOperation: createPurchaseDto.operationType,
      userId: userId,
    });

    let allProductsFound = true;

    createPurchaseDto.productIds.forEach(async (productId) => {
      const product = await Product.findOne({
        where: { id: productId },
      });

      if (!product) {
        allProductsFound = false;
      }
    });

    if (!allProductsFound) {
      throw new HttpErrorByCode[HttpStatus.BAD_REQUEST](
        "Product doesn't exist",
      );
    }

    createPurchaseDto.productIds.forEach(async (productId) => {
      await Purchase.upsert({
        productId: productId,
        purchaseId: purch[0].id,
      });
    });

    // à recuperer les discount pour chaque produit
    //implementer les discounts
    //total à payer pour l'utilisateur

    return HttpStatus.CREATED; //a payer
  }
}
