import {
  Table,
  Column,
  Model,
  DataType,
  PrimaryKey,
} from 'sequelize-typescript';

@Table
export class Product extends Model {
  @PrimaryKey
  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
  })
  id: string;

  @Column(DataType.TEXT)
  name: string;

  @Column(DataType.STRING)
  brandName: string;

  @Column(DataType.FLOAT)
  price: number;

  @Column(DataType.STRING)
  imgUrl: string;

  @Column(DataType.INTEGER)
  stock: number;
}
