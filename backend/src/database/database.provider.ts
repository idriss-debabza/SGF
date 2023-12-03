import { Sequelize } from 'sequelize-typescript';
import { User } from '../models/user.model';
import { Product } from '../models/product.model'; // a changé avec mes modeles
import { Purchase } from '../models/purchase.model'; // a changé avec mes modeles
import { PurchaseProduct } from '../models/purchaseProduct.model'; // a changé avec mes modeles
import { ProductDiscount } from '../models/productDiscount.model'; // a changé avec mes modeles

export const databaseProviders = [
  {
    provide: 'SEQUELIZE',
    useFactory: async () => {
      const sequelize = new Sequelize({
        dialect: 'mysql',
        host: 'localhost',
        port: 3306,
        username: 'root',
        password: 'myrootpassword',
        database: 'sgf',
      });
      sequelize.addModels([
        User,
        Product,
        PurchaseProduct,
        Purchase,
        ProductDiscount,
      ]);
      await sequelize.sync();
      return sequelize;
    },
  },
];
