#!/bin/sh

CONTAINER_NAME="phpcs-composer-new"
targ=$1
var=$2


docker compose up -d
docker compose cp $targ $CONTAINER_NAME:/app
docker compose exec -it $CONTAINER_NAME phpcs -p $targ --standard=PHPCompatibility --runtime-set testVersion $var
docker compose down