#!/bin/bash

source ./port.sh
source ./version.sh
source ./docker_name.sh
docker run --name $DOCKER_NAME -d -p $HOST_PORT:$PORT $DOCKER_NAME:$VERSION
