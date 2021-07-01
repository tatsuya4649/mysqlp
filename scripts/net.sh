#!/bin/bash

source ./netname.sh
if ! docker network create $TESTNETNAME; then
	echo "network create failure..."
	exit 1
fi
