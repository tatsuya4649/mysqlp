#!/bin/bash

# setting file for name,version,etc.
source ./const.sh

# End Scripts of Test
# Delete unnecessary containers etc.

# Delete Test Image
TEST_IMAGE=$($SUDO docker images  $TESTNAME -q)

if [ -n "$TEST_IMAGE" ]; then
	$SUDO docker rmi -f $TEST_IMAGE
	echo "Test Image Delete!"
else
	echo "not found test image..."
	exit 1
fi


# Delete Test Network
TEST_NET=$($SUDO docker network ls -f name=$TESTNETNAME -q)
if [ -n "$TEST_NET" ]; then
	$SUDO docker network rm $TEST_NET
	echo "delete test network"
else
	echo "not found test network..."
fi
