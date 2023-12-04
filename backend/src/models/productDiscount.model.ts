// ProductDiscounts model
import {
  Table,
  Column,
  Model,
  DataType,
  ForeignKey,
  BelongsTo,
  PrimaryKey,
} from 'sequelize-typescript';
import { Product } from './product.model';

import { DiscountTypeEnum } from './constants/discount-type.enum';

@Table
export class ProductDiscount extends Model {
  @PrimaryKey
  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
  })
  id: string;

  @ForeignKey(() => Product)
  @Column(DataType.UUID)
  productId: string;

  @Column(DataType.ENUM(...Object.values(DiscountTypeEnum)))
  discountType: DiscountTypeEnum;

  @Column(DataType.FLOAT)
  discountAmount: number;

  @BelongsTo(() => Product)
  product: Product;
}
