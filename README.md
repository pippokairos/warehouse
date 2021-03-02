# Warehouse

## Introduction

This is just a sample Rails application managing products and criteria definitions to determine their routing.

## Installation

Clone the repository
```bash
git clone https://github.com/pippokairos/warehouse.git
```

Create `.env` and `config/database.yml` files and edit them accordingly.

```bash
cp .env.sample .env
cp config/database.yml.sample config/database.yml
```

___

### With Docker

You'll need the following tools installed on your system:
- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker Compose](https://docs.docker.com/compose/install/)

##### 1. Create and start the containers

```bash
docker-compose up
```

##### 2. Create and migrate the DB

```bash
docker exec -it <psql-container-id> psql postgres -U postgres
create database warehouse;
create database warehouse_test;
docker exec -it <web-container-id> rails db:migrate
```

You can access the app from http://localhost:3000

___

### Native

You'll need the following tools installed on your system:

- [Ruby 2.6.6](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-6-6-released/)
- [Rails 5.0.2](https://rubygems.org/gems/rails/versions/5.0.2)
- [PostgreSQL >= 12](https://www.postgresql.org/download/)
- [Yarn](https://yarnpkg.com/getting-started/install)

##### 1. Check out the repository

```bash
git clone https://github.com/pippokairos/warehouse.git
```

##### 2. Install all dependencies

Change directory and run bundle and yarn installation.

```bash
cd warehouse
bundle install
yarn install --check-files
```

##### 3. Create the database.

Create and setup the database.

```bash
rails db:create
rails db:migrate
```

##### 4. Start the Rails server

You can now start the server.

```bash
rails s
```

You can access the app from http://localhost:3000