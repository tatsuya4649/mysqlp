#!/bin/bash

TESTNET="../TESTNET"

if [ -f $TESTNET ];then
	TESTNETNAME=$(cat TESTNET)
else
	echo "not found test network file..."
fi

docker create network $TESTNETNAME
