#!/bin/bash

source ./port.sh
source ./version.sh
source ./docker_name.sh
source ./datadir.sh
docker run --name $DOCKER_NAME -d -p $HOST_PORT:$PORT -v $DATADIR:/var/lib/mysql $DOCKER_NAME:$VERSION
