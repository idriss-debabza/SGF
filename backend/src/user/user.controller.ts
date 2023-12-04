import {
  Controller,
  UseGuards,
  Get,
  Post,
  Body,
  HttpException,
  HttpStatus,
} from '@nestjs/common';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { UserId } from '../auth/decorators/user-id.decorator';
import { CreateUserDto } from './dto/create-user.dto';
import * as bcrypt from 'bcrypt';
import { ApiBody, ApiBearerAuth, ApiTags } from '@nestjs/swagger';
import { HttpErrorByCode } from '@nestjs/common/utils/http-error-by-code.util';
import { User } from 'src/models/user.model';

@ApiTags('User')
@Controller('user')
export class UserController {
  @UseGuards(JwtAuthGuard)
  @ApiBearerAuth()
  @Get()
  async getUserFromJwt(@UserId() userId: string) {
    const user = await User.findOne({
      where: { id: userId },
      
    });

    if (!user) {
      throw new HttpException('User not found', HttpStatus.FORBIDDEN);
    }

    return user;
  }

  @ApiBearerAuth()
  @Post()
  @ApiBody({ type: CreateUserDto })
  async createUser(@Body() createUserDto: CreateUserDto) {
    const isEmailTaken = await User.findOne({
      where: { email: createUserDto.email },
    });

    if (isEmailTaken) {
      throw new HttpErrorByCode[HttpStatus.BAD_REQUEST]();
    }

    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(createUserDto.password, salt);

    await User.upsert({
      firstName: createUserDto.firstName,
      lastName: createUserDto.lastName,
      email: createUserDto.email,
      password: hashedPassword,
    });

    return HttpStatus.CREATED;
  }
}
