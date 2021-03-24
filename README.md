[![Docker Build Status](https://img.shields.io/docker/build/diddado/revive.svg?style=for-the-badge)](https://hub.docker.com/r/diddado/revive/)
[![Docker Pulls](https://img.shields.io/docker/pulls/diddado/revive.svg?style=for-the-badge)](https://hub.docker.com/r/diddado/revive/)
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/diddado/revive.svg?style=for-the-badge)](https://hub.docker.com/r/diddado/revive/)

# README #

Revive AdServer docker image based on Alpine Linux with nginx, php7-fpm and Revive adserver 5.2.0

### What is this repository for? ###

* Quick summary:
    Revive AdServer docker image based on Alpine Linux with nginx, php7-fpm and Revive Ad Server 5.2.0

* Version 5.2.0
* [Repository Link](https://github.com/diddado/ReviveDockerImage.git)

### To build the image locally
```bash
./build.sh
```

### How do I get set up? ###
```bash
docker pull diddado/revive
```

### Docker Compose ###

* Create a docker-compose.yml file, or use the one in the repository

```yml
version: '3.3'
services:
    revive:
        build: .
        image: diddado/revive
        container_name: revive
        ports:
         - '8080:80'
        restart: always
        depends_on:
                - mysql
    mysql:
        image: mysql:5.7
        restart: always
        environment:
         - MYSQL_DATABASE=revive
         - MYSQL_USER=user
         - MYSQL_PASSWORD=password
```

`docker-compose up -d`

Visit http://localhost:8080/ and complete the setup using the following for MySQL settings:

* host = mysql
* user = user
* password = password 


