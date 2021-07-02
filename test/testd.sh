#!/bin/bash

# setting file for name,version,etc.
source ./const.sh

HOSTPORT=13306
PORT=3306

# if already exist image, delete
ALREADY=$($SUDO docker images $TESTNAME -q)
if [ -n "$ALREADY" ]; then
	$SUDO docker rmi -f $ALREADY
	echo "delete $TESTNAME image"
fi

$SUDO docker build -t $TESTNAME:$VERSION .

# get container ip address
cd ../scripts/
source ../scripts/gcontid.sh
gcontid
cd ../test/

CONTAINER_DETAIL_ID=$($SUDO docker container inspect $CONTAINER_ID | jq .[0].Id)
echo "$DOCKER_NAME CONTAINER_DETAIL_ID => $CONTAINER_DETAIL_ID"
if [ -n "$CONTAINER_DETAIL_ID" ]; then
	IP=$($SUDO docker network inspect testmysql | jq .[0].Containers."$CONTAINER_DETAIL_ID".IPv4Address)
	echo "IP Address => $IP"
else
	echo "can't get CONTAINER_ID"
	exit 1
fi

echo $HOSTPORT
echo $PORT
echo $IP
echo $TESTNAME
echo $VERSION

$SUDO docker run --network $TESTNETNAME -t -p $HOSTPORT:$PORT -e TESTIP=$IP --env-file TESTENV $TESTNAME:$VERSION
