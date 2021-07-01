#!/bin/bash 

function gcontid(){
	source ./docker_name.sh
	CONTAINER_ID=$(docker container ls -aq --filter name=$DOCKER_NAME)

	# if None container
	if [ -z "$CONTAINER_ID" ]; then
		echo "no $DOCKER_NAME container $CONTAINER_ID"
		exit 1
	else
		echo "$DOCKER_NAME CONTAINER_ID => $CONTAINER_ID"
	fi
}
