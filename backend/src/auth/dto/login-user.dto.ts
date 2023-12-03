import { IsEmail, IsStrongPassword } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class LoginUserDto {
  @ApiProperty({ example: 'rayan.koussa@gmail.com' })
  @IsEmail()
  email: string;

  @ApiProperty({ example: 'mypassword' })
  @IsStrongPassword({
    minLength: 6,
    minLowercase: 0,
    minNumbers: 0,
    minSymbols: 0,
    minUppercase: 0,
  })
  password: string;

  constructor(email: string, password: string) {
    this.email = email;
    this.password = password;
  }
}
