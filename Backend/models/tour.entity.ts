import { Column, Entity, ManyToMany, ManyToOne } from "typeorm"
import { User } from "./user.entity"

@Entity()
export class Tour {
    @Column()
    name: string

    @Column()
    shortDescription: string

    @Column()
    description: string

    @ManyToOne(() => User, u => u.createdTours)
    author: User

    @ManyToMany(() => User)
    usersDone: User[]
}