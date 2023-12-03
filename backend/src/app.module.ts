import { Module } from '@nestjs/common';
import { PassportModule } from '@nestjs/passport';
import { JwtModule } from '@nestjs/jwt';
import { JwtStrategy } from './auth/jwt.strategy'; // Create this strategy
import { AuthModule } from './auth/auth.module';
import { databaseProviders } from './database/database.provider';
import { UserModule } from './user/user.module';
import { ProductModule } from './product/product.module';
import { PurchaseModule } from './purchaseProduct/purchase.module';

@Module({
  imports: [
    PassportModule.register({ defaultStrategy: 'jwt' }),
    JwtModule.register({
      secret: 'your-secret-key',
      signOptions: { expiresIn: '1h' },
    }),
    AuthModule,
    UserModule,
    ProductModule,
    PurchaseModule,
  ],
  providers: [JwtStrategy, ...databaseProviders],
  exports: [PassportModule, JwtModule],
})
export class AppModule {}
