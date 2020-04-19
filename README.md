# docker-1c-server

## Что это?

docker-1c-server -- это сервер 1С:Предприятия в контейнере Docker.

В качестве сервера баз данных можно использовать [Postgres Professional в контейнере Docker](https://github.com/lufton/postgrespro-1c).

## Как это установить?

Для установки и начального запуска получите дистрибутив сервера 1С:Предприятия: https://users.v8.1c.ru/ -> Скачать обновления -> Технологическая платформа 8.3 -> ВЕРСИЯ -> Cервер 1С:Предприятия (64-bit) для DEB-based Linux-систем -> Скачать дистрибутив

Клонируйте репозиторий:

    git clone https://github.com/lufton/1c-server.git

Скопируйте deb-файлы дистрибутива сервера 1С:Предприятия в каталог `docker-1c-server` и затем выполните команды (здесь и далее вам понадобятся права администратора):

    cd docker-1c-server
    ./build.sh
    ./run.sh

Узнать UID и GID пользователя, с правами которого сервер 1С:Предприятия работает в контейнере, можно с помощью команды

    docker exec 1c-server id usr1cv8

которая выдаст примерно такие данные

    uid=999(usr1cv8) gid=1000(grp1cv8) groups=1000(grp1cv8)

## Как остановить/запустить/перезапустить контейнер?

Для управления контейнером используйте команды:

    docker stop 1c-server
    docker start 1c-server
    docker restart 1c-server

Для запуска hasp зайдите в docker

    docker exec -ti lufton/1-server bash

и запустите hasp

    systemctl start haspd

сохраните образ

    docker commit "ID_вашего_образа"

## Где мои данные?

Данные сервера 1С:Предприятия вы можете найти в каталогах `/var/lib/docker/volumes/1c-server-home/_data` (домашний каталог пользователя `usr1cv8`) и `/var/lib/docker/volumes/1c-server-logs/_data` (технологические журналы).
По умлочанию монтируется в /mnt/1c_data

## Как это удалить?

Удалите контейнер:

    docker rm -f 1c-server

Удалите образ:

    docker rmi alexanderfefelov/1c-server

:fire: Удалите данные:

    docker volume rm 1c-server-home
    docker volume rm 1c-server-logs
