import {
  HttpException,
  HttpStatus,
  Injectable,
  Logger,
  Inject,
} from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { Sequelize } from 'sequelize';
import { User } from 'src/models/user.model';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthService {
  private readonly logger = new Logger(AuthService.name);

  constructor(
    @Inject('SEQUELIZE')
    private sequelize: Sequelize,
    private jwtService: JwtService,
  ) {}

  async validateUser(email: string, password: string): Promise<any> {
    try {
      const user = await User.findOne({ where: { email: email } });
      this.logger.log('where is the error ?');
      if (!user) {
        throw new HttpException('Invalid Credentials', HttpStatus.UNAUTHORIZED);
      }

      const isMatch = await bcrypt.compare(password, user.password);
      if (!isMatch) {
        throw new HttpException('Invalid Credentials', HttpStatus.UNAUTHORIZED);
      }

      return user;
    } catch (error) {
      this.logger.error(`Error in validateUser: ${error.message}`);
      throw new HttpException(
        'Internal Server Error',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }

  async login(user: any) {
    try {
      const payload = { id: user.id };
      this.logger.log(`Login payload: ${JSON.stringify(payload)}`);
      return {
        accessToken: this.jwtService.sign(payload),
      };
    } catch (error) {
      this.logger.error(`Error in login: ${error.message}`);
      throw new HttpException(
        'Internal Server Error',
        HttpStatus.INTERNAL_SERVER_ERROR,
      );
    }
  }
}
