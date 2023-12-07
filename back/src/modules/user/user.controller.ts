import { Body, Controller, Get, Post, Req, UseGuards } from '@nestjs/common';
import { UserService } from './user.service';
import { ApiBearerAuth, ApiOperation } from '@nestjs/swagger';
import { OutGetProfileDto } from './dtos/out-get-profile.dto';
import { AuthGaurd } from 'src/guards/auth.guard';
import { InCreateChildBodyDto } from './dtos/in-create-child.dto';

@UseGuards(AuthGaurd)
@Controller('profile')
export class UserController {
  constructor(private readonly userService: UserService) {}

  @Get('')
  @ApiBearerAuth()
  @ApiOperation({ summary: 'get user Profile' })
  async get(@Req() { userId }: { userId: string }): Promise<OutGetProfileDto> {
    return this.userService.getProfile(userId);
  }

  @Post('/children')
  @ApiBearerAuth()
  @ApiOperation({ summary: 'create a child' })
  async createChildren(
    @Req() { userId }: { userId: string },
    @Body() input: InCreateChildBodyDto,
  ) {
    return this.userService.createChild(userId, input);
  }

  @Get('/children')
  @ApiBearerAuth()
  @ApiOperation({ summary: 'get all chilren ' })
  async getChildren(@Req() { userId }: { userId: string }) {
    return this.userService.getChildren(userId);
  }

  @Get('/transactions')
  @ApiBearerAuth()
  @ApiOperation({ summary: 'get all transactions' })
  async getTransactions(@Req() { userId }: { userId: string }) {
    return this.userService.getTransactions(userId);
  }
}
