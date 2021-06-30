#!/bin/bash
PORT_FILE="../PORT"
if [ -f $PORT_FILE ]; then
	PORT=$(cat $PORT_FILE)
else
	echo "not found MySQL PORT file..."
fi
HOSTPORT_FILE="../HOSTPORT"
if [ -f $HOSTPORT_FILE ]; then
	HOSTPORT=$(cat $HOSTPORT_FILE)
else
	echo "not found MySQL Host PORT file..."
fi
