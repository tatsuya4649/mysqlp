#!/bin/bash

source ./netname.sh
source ./sudo.sh
if ! $SUDO docker network create $TESTNETNAME; then
	echo "network create failure..."
	exit 1
fi
