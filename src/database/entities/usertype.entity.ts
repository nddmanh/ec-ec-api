import { Entity, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import CustomBaseEntity from './base.entity';
import { User } from './user.entity';

// Config after design database
@Entity('user_types')
export class UserType extends CustomBaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @OneToMany(() => User, (user) => user.userType, {
    cascade: true,
    onDelete: 'CASCADE',
  })
  users: User[];
}
