#!/bin/bash
# delete container
source ./gcontid.sh

#get delete container id
gcontid

# delete container from CONTAINER_ID
docker container stop $CONTAINER_ID
echo "stop container $CONTAINER_ID"
docker container rm $CONTAINER_ID
echo "remove container $CONTAINER_ID"

source ./netname.sh
docker network rm $TESTNETNAME
echo "remove network $TESTNETNAME"
