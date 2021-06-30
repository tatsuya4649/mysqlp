#!/bin/bash

DOCKER="../Dockerfile"

source ./docker_name.sh
source ./version.sh

if [ -f $DOCKER ]; then
	docker build -t $DOCKER_NAME:$VERSION ..
	exit 0
else
	echo "not found... $DOCKER"
	exit 1
fi
