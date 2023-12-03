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
  Logger,
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
import { User } from 'src/models/user.model';

import { DiscountTypeEnum } from '../models/constants/discount-type.enum';
import { ProductDiscount } from '../models/productDiscount.model';

@ApiTags('Purchase Product')
@Controller('purchase')
export class PurchaseController {
  private readonly logger = new Logger(PurchaseController.name);

  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Get()
  async getAllPurchase(@UserId() userId: string) {
    const purchases = PurchaseProduct.findAll({
      include: [Purchase, Product],
    });

    return purchases;
  }

  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Get(':purchaseId')
  @ApiParam({ name: 'purchaseId' })
  async getPurchaseById(@Param() purchaseId) {
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
    //create purchase with (userid, typeOperation)                  OK
    //verifier le stock pour chaque produit                         OK
    //create purchaseProduct with (purchaseId, [productId])
    //recuperer les discounts pour chaque produit et les appliqué
    //retourner le total à payer
    const purchase = await Purchase.upsert({
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

    //verifier le stock pour chaque produit
    // const array: string[] = ['id1', 'id1', 'id1', 'id2'];
    const products = createPurchaseDto.productIds;
    const counter: Record<string, number> = {};

    for (const product of products) {
      counter[product] = (counter[product] || 0) + 1;
    }

    for (const product of products) {
      const productStock = await Product.findOne({
        where: { id: product },
      });

      if (productStock.stock < counter[product]) {
        throw new HttpErrorByCode[HttpStatus.BAD_REQUEST](
          'Not enough stock for product ' + product,
        );
      }
    }

    await Promise.all(
      createPurchaseDto.productIds.map(async (productId) => {
        const purchaseProduct = await PurchaseProduct.upsert({
          purchaseId: purchase[0].id,
          productId: productId,
        });
      }),
    );

    //diminuer le stock pour chaque produit
    await Promise.all(
      createPurchaseDto.productIds.map(async (productId) => {
        const product = await Product.findOne({
          where: { id: productId },
        });

        const newStock = product.stock - 1;

        await Product.update(
          { stock: newStock },
          {
            where: { id: productId },
          },
        );
      }),
    );
    //appliquer les remises pour chaque produit ici

    const purchaseProducts = await PurchaseProduct.findAll({
      where: { purchaseId: purchase[0].id },
      include: { model: Product, attributes: ['id', 'price'] },
    });

    // Parcourir chaque produit dans l'achat
    // Déclare une variable pour stocker le total des remises
    let totalDiscount = 0;

    // Parcourir chaque produit dans l'achat
    for (const purchaseProduct of purchaseProducts) {
      const product = purchaseProduct.product;

      // Récupérer les remises pour le produit
      const discounts = await ProductDiscount.findAll({
        where: { productId: product.id },
      });

      // Appliquer les remises pour chaque produit
      discounts.forEach((discount) => {
        switch (discount.discountType) {
          case DiscountTypeEnum.Percentage:
            totalDiscount += product.price * discount.discountAmount;
            break;
          case DiscountTypeEnum.FixedAmount:
            totalDiscount += discount.discountAmount;
            break;
          case DiscountTypeEnum.SecondProduct:
            if (counter[product.id] === 2) {
              totalDiscount += discount.discountAmount;
            }
            break;
        }
      });
    }

    this.logger.error('total', totalDiscount);
    let total = 0;

    purchaseProducts.forEach((product) => {
      total += product.product.price;
    });

    const user = await User.findOne({
      where: { id: purchase[0].userId },
    });

    const availableCredit = user.totalDiscount;

    if (purchase[0].typeOperation == 'Utilise' && total <= availableCredit) {
      throw new HttpErrorByCode[HttpStatus.BAD_REQUEST]('Not enough credit');
    } else if (
      purchase[0].typeOperation == 'Utilise' &&
      total > availableCredit
    ) {
      user.totalDiscount -= totalDiscount;
    } else {
      user.totalDiscount += totalDiscount;
    }
    await user.save();

    await Purchase.update({ total: total }, { where: { id: purchase[0].id } });

    return HttpStatus.CREATED;
  }
}
