#!/bin/bash

docker build --tag lufton/1c-server .

docker push lufton/1c-server
docker pull lufton/1c-server
echo 'Starting lufton/1c-server'
bash run.sh

