import { Controller, Post, Logger, Body } from '@nestjs/common';
import { AuthService } from './auth.service';
import { ApiBody, ApiTags } from '@nestjs/swagger';
import { LoginUserDto } from './dto/login-user.dto';

@ApiTags('User')
@Controller('auth')
export class AuthController {
  @ApiBody({ type: LoginUserDto })
  @Post('login')
  async login(@Body() loginUserDto: LoginUserDto) {
    const user = await this.authService.validateUser(
      loginUserDto.email,
      loginUserDto.password,
    );
    return this.authService.login(user);
  }

  constructor(private authService: AuthService) {}
}
