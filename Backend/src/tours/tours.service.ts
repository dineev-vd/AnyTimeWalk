import { Injectable } from "@nestjs/common";
import { InjectRepository } from "@nestjs/typeorm";
import { Tour } from "models/tour.entity";
import { Repository } from "typeorm";

@Injectable()
export class ToursService {
    constructor(
        @InjectRepository(Tour)
        private tours: Repository<Tour>
    ) { }
}