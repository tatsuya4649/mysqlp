#!/bin/bash

TESTNAME=testmy
TESTNET="../TESTNET"
if [ -f $TESTNET ]; then
	TESTNETNAME=$(cat TESTNET)
else
	echo "not found test net file..."
fi

docker build -t $TESTNAME .
docker run --network $TESTNETNAME -p13306:3306 -e TESTIP=$IP --env-file TESTENV

