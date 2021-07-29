# BNW Docker Dev

Este repositório contém imagens contendo instalações pré-configuradas e exclusivas para desenvolvimento de aplicações. A idéia é facilitar a configuração de ambientes, usando apenas um arquivo docker-compose.yml e nada mais.

- [GitHUB](https://github.com/bueno-networks/docker-dev)
- [DockerHUB](https://hub.docker.com/repository/docker/bnwdocker/dev-images)

As imagens não foram criadas para utilização em ambientes de produção! São imagens grandes, contendo ferramentas e extensões que podem ser desnecessárias para outro fim que não seja o uso para desenvolvimento.

## Linguagens

- PHP 7.4
- PHP 8.0

Um exemplo de configuração via Docker Compose:

```
version: "3.9"
services:
  mysql:
    image: bnwdocker/dev-images:php80
    container_name: container-php
    volumes:
      - .:/application
    ports:
      - "8080:80"
      - "9090:3306"
    networks:
      - my-network

networks:
  my-network:
    driver: bridge
```

## Bancos de Dados SQL

- MySQL 5.7
- MySQL 8.0

Um exemplo de configuração via Docker Compose:

```
version: "3.9"
services:
  mysql:
    image: bnwdocker/dev-images:mysql80
    container_name: container-mysql
    volumes:
      - ./my-mysql/storage:/var/lib/mysql
    ports:
      - "8080:80"
      - "9090:3306"
    networks:
      - my-network

networks:
  my-network:
    driver: bridge
```
