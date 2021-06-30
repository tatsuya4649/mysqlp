#!/bin/bash

DOCKER="../Dockerfile"

source ./version.sh

if [ -f $DOCKER ]; then
	docker build -t $DOCKER_NAME:$VERSION ..
	exit 0
else
	echo "not found... $DOCKER"
	exit 1
fi
