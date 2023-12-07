import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { appController } from './app.controller';

@Module({
  imports: [MongooseModule.forRoot('mongodb://localhost:27017/khorsand87')],
  controllers: [appController],
})
export class AppModule {}
