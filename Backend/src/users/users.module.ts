import { Module } from "@nestjs/common";
import { UsersController } from "./users.controller";
import { UserService } from "./users.service";

@Module({
    imports: [],
    providers: [UserService],
    controllers: [UsersController]
})
export class UsersModule { }