import { Column, Entity, ManyToMany, OneToMany, PrimaryGeneratedColumn } from "typeorm"
import { Tour } from "./tour.entity"

@Entity()
export class User {
    @PrimaryGeneratedColumn()
    id: number

    @Column({ unique: true })
    email: string

    @Column({ select: false })
    password: string

    @Column({ nullable: true })
    avatar?: string

    @OneToMany(() => Tour, t => t.author)
    createdTours: Tour[]

    @ManyToMany(() => Tour, t => t.usersDone)
    doneTours: Tour[]
}