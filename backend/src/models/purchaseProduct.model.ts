import {
  Table,
  Column,
  Model,
  DataType,
  ForeignKey,
  BelongsTo,
  PrimaryKey,
} from 'sequelize-typescript';
import { Purchase } from './purchase.model';
import { Product } from './product.model';

@Table
export class PurchaseProduct extends Model {
  @PrimaryKey
  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
  })
  id: string;

  @ForeignKey(() => Purchase)
  @Column(DataType.UUID)
  purchaseId: string;

  @ForeignKey(() => Product)
  @Column(DataType.UUID)
  productId: string;

  @BelongsTo(() => Purchase)
  purchase: Purchase;

  @BelongsTo(() => Product)
  product: Product;
}
