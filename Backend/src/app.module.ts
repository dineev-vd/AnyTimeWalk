import { Module } from '@nestjs/common';
import { TypeOrmModule } from "@nestjs/typeorm"
import { User } from 'models/user.entity';
import { Tour } from 'models/tour.entity';
import { UsersModule } from './users/users.module';
import { ToursModule } from './tours/tours.module';


const {
  POSTGRES_HOST,
  POSTGRES_PORT,
  POSTGRES_USER,
  POSTGRES_PASSWORD,
  POSTGRES_DB,
} = process.env;

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: POSTGRES_HOST,
      port: +POSTGRES_PORT,
      username: POSTGRES_USER,
      password: POSTGRES_PASSWORD,
      database: POSTGRES_DB,
      entities: [User, Tour],
      synchronize: true,
      dropSchema: true
    }),
    UsersModule,
    ToursModule
  ],
  controllers: [],
  providers: [],
})
export class AppModule { }
