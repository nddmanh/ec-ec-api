import {
  BaseEntity,
  CreateDateColumn,
  DeleteDateColumn,
  UpdateDateColumn,
} from 'typeorm';

export default abstract class CustomBaseEntity extends BaseEntity {
  @CreateDateColumn({
    nullable: false,
  })
  createdAt?: Date = new Date();

  @UpdateDateColumn({
    nullable: false,
  })
  updatedAt?: Date = new Date();

  @DeleteDateColumn({
    nullable: true,
  })
  deletedAt?: Date;
}
