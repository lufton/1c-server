#!/bin/sh

docker run --name 1c-server --restart=always \
  --net host \
  --detach \
  --volume /mnt/1c_data:/var/lib/docker/volumes/1c-server-home/_data \
  --volume /home/usr1cv8:/home/usr1cv8 \
  --volume /var/log/1C:/var/log/1C \
  --volume /etc/localtime:/etc/localtime:ro \
 lufton/1c-server
