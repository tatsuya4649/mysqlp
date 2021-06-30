#!/bin/bash

DATADIR_FILE="../DATADIR"

if [ -f $DATADIR_FILE ]; then
	DATADIR=$(cat $DATADIR_FILE)
else
	echo "not found DATADIR file..."
	exit 1
fi
