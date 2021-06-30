#!/bin/bash

source ./port.sh
source ./version.sh
source ./docker_name.sh
source ./datadir.sh

ENVFILE=../ENV

docker run --name $DOCKER_NAME --env-file $ENVFILE -d -p $HOST_PORT:$PORT -v $DATADIR:/var/lib/mysql $DOCKER_NAME:$VERSION
