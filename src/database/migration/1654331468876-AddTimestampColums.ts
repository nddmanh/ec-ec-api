import { MigrationInterface, QueryRunner, TableColumn } from 'typeorm';

export class AddTimestampColums1641291245872 implements MigrationInterface {
  static readonly tablesName = [
    'user_types',
    'users',
    'product_template',
    'product_categories',
    'product_attribute',
    'product_template_attribute',
    'product_variant',
    'images',
    'reviews',
    'orders',
    'order_lines',
    'carts',
    'cart_lines',
  ];

  public async up(queryRunner: QueryRunner): Promise<void> {
    for (const tableName of AddTimestampColums1641291245872.tablesName) {
      if (!(await queryRunner.hasTable(tableName))) {
        continue;
      }
      await queryRunner.addColumns(tableName, [
        new TableColumn({
          name: 'createdAt',
          type: 'datetime',
          isNullable: false,
        }),
        new TableColumn({
          name: 'updatedAt',
          type: 'datetime',
          isNullable: false,
        }),
        new TableColumn({
          name: 'deletedAt',
          type: 'datetime',
          isNullable: true,
        }),
      ]);
    }
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    for (const tableName of AddTimestampColums1641291245872.tablesName) {
      if (!(await queryRunner.hasTable(tableName))) {
        continue;
      }
      await queryRunner.dropColumns(tableName, [
        'createdAt',
        'updatedAt',
        'deletedAt',
      ]);
    }
  }
}
