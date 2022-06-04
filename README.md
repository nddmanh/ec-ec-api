## Description

Ec ec API ecommerce

## Installation

```bash
$ npm install
```

## Setup database

```bash
$ cd infra
$ docker-compose up -d ecec-dbsql
$ cd ..
$ npm run migration:run
```

## Config env

```bash
Loading...
```

## Running the app

```bash
# development
$ npm run start

# watch mode
$ npm run start:dev

# production mode
$ npm run start:prod
```

## Test

```bash
# unit tests
$ npm run test

# e2e tests
$ npm run test:e2e

# test coverage
$ npm run test:cov
```

