import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import CustomBaseEntity from './base.entity';
import { UserType } from './usertype.entity';

// Config after design database
@Entity('users')
export class User extends CustomBaseEntity {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ unique: true })
  email: string;

  @ManyToOne(() => UserType, (userType) => userType.users)
  @JoinColumn({ name: 'user_type_id' })
  userType: UserType;

  @Column()
  name: string;

  @Column()
  desc: string;
}
