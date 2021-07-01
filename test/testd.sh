#!/bin/bash

TESTNET="../TESTNET"
TESTNAME=testmy
VERSION=0.0
HOSTPORT=13306
PORT=3306

if [ -f $TESTNET ]; then
	TESTNETNAME=$(cat $TESTNET)
else
	echo "not found test net file..."
fi

# if already exist image, delete
ALREADY=$(docker images $TESTNAME -q)
if [ -n "$ALREADY" ]; then
	docker rmi -f $ALREADY
	echo "delete $TESTNAME image"
fi

docker build -t $TESTNAME:$VERSION .

# get container ip address
cd ../scripts/
source ../scripts/gcontid.sh
gcontid
cd ../test/

CONTAINER_DETAIL_ID=$(docker container inspect $CONTAINER_ID | jq .[0].Id)
echo "$DOCKER_NAME CONTAINER_DETAIL_ID => $CONTAINER_DETAIL_ID"
if [ -n "$CONTAINER_DETAIL_ID" ]; then
	IP=$(docker network inspect testmysql | jq .[0].Containers."$CONTAINER_DETAIL_ID".IPv4Address)
	echo "IP Address => $IP"
else
	echo "can't get CONTAINER_ID"
	exit 1
fi

docker run --network $TESTNETNAME -t -p $HOSTPORT:$PORT -e TESTIP=$IP --env-file TESTENV $TESTNAME:$VERSION
