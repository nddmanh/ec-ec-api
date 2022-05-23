export default () => ({
  port: parseInt(process.env.PORT, 10) || 3000,
  database: {
    type: 'mysql',
    username: process.env.DATABASE_USERNAME || 'ecec',
    password: process.env.DATABASE_PASSWORD || 'ecec',
    database: process.env.DATABASE_NAME || 'ecec',
    host: process.env.DATABASE_HOST || 'localhost',
    port: parseInt(process.env.DATABASE_PORT, 10) || 3306,
    logging: process.env.DATABASE_LOGGING ? true : false,
  },
});
