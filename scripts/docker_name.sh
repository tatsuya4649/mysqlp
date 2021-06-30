#!/bin/bash

DOCKER_NAME_FILE="../DOCKER_NAME"

if [ -f $DOCKER_NAME_FILE ]; then
	DOCKER_NAME=$(cat $DOCKER_NAME_FILE)
else
	echo "not found DOCKER NAME FILE..."
	exit 1
fi
