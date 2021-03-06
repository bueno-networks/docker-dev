# BNW Docker Dev

Este repositório contém imagens contendo instalações pré-configuradas e exclusivas para desenvolvimento de aplicações. A idéia é facilitar a configuração de ambientes, usando apenas um arquivo docker-compose.yml e nada mais.

- [GitHUB](https://github.com/bueno-networks/docker-dev)
- [DockerHUB](https://hub.docker.com/repository/docker/bnwdocker/dev-images)

As imagens não foram criadas para utilização em ambientes de produção! São imagens grandes, contendo ferramentas e extensões que podem ser desnecessárias para outro fim que não seja o uso para desenvolvimento.

## Imagens do PHP

As imagens já vêm com servidor web NGINX instalado e configurado na porta 80.

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
    networks:
      - my-network

networks:
  my-network:
    driver: bridge
```

Por padrão, o domínio "localhost" é mapeado para o diretório 'public/' da aplicação.
Para mudar isso, basta adicionar um arquivo de configuração (nginx.conf) personalizado,
apontando-o como volume no docker-compose.yml. Por exemplo:

```
    volumes:
      - .:/application
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
```

## Imagens do MySQL

As imagens do MySQL já vem com PHPMyAdmin configurado na porta 80.

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
      - "4040:80"
      - "5050:3306"
    networks:
      - my-network

networks:
  my-network:
    driver: bridge
```

Para conectar ao banco de dados, as seguintes informações estão previamente configuradas:

Diretiva               | Valor
---------------------- | -------
Senha do usuário root: | devel 
Nome do Banco:         | devel
Usuario padrão:        | devel
Senha usuario padrão:  |devel

Caso seja necessário mudar a configuração padrão, basta adicionar as diretivas correspondentes no parâmetro "environment" no arquivo docker-compose.yml:

- MYSQL_ROOT_PASSWORD
- MYSQL_DATABASE
- MYSQL_USER
- MYSQL_PASSWORD

Por exemplo: 

```
services:
  mysql:
    image: bnwdocker/dev-images:mysql80
    container_name: container-mysql
    environment:
      MYSQL_ROOT_PASSWORD: example
    volumes:
      - ./my-mysql/storage:/var/lib/mysql
```
