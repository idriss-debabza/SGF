import {
  IsEmail,
  IsNotEmpty,
  IsString,
  IsStrongPassword,
} from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateUserDto {
  @ApiProperty({ example: 'Rayan' })
  @IsNotEmpty()
  @IsString()
  public firstName: string;

  @ApiProperty({ example: 'Koussa' })
  @IsNotEmpty()
  @IsString()
  public lastName: string;

  @ApiProperty({ example: 'rayan.koussa@gmail.com' })
  @IsEmail()
  public email: string;

  @ApiProperty({ example: 'mypassword' })
  @IsStrongPassword({
    minLength: 6,
    minLowercase: 0,
    minNumbers: 0,
    minSymbols: 0,
    minUppercase: 0,
  })
  public password: string;

  constructor(
    firstName: string,
    lastName: string,
    email: string,
    password: string,
  ) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.email = email;
    this.password = password;
  }
}
