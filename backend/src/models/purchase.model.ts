import {
  Table,
  Column,
  Model,
  DataType,
  ForeignKey,
  BelongsTo,
  PrimaryKey,
} from 'sequelize-typescript';
import { User } from './user.model';

@Table
export class Purchase extends Model {
  @PrimaryKey
  @Column({
    type: DataType.UUID,
    defaultValue: DataType.UUIDV4,
  })
  id: string;

  @ForeignKey(() => User)
  @Column(DataType.UUID)
  userId: string;

  @Column(DataType.ENUM('Gagne', 'Utilise'))
  typeOperation: string;

  @Column(DataType.FLOAT)
  total: number;

  @BelongsTo(() => User)
  user: User;
}
