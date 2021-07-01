#!/bin/bash

# setting file for name,version,etc.
./const.sh

# End Scripts of Test
# Delete unnecessary containers etc.

# Delete Test Image
TEST_IMAGE=$(docker images  $TESTNAME -q)

if [ -n "$TEST_IMAGE" ]; then
	docker rmi -f $TEST_IMAGE
	echo "Test Image Delete!"
else
	echo "not found test image..."
	exit 1
fi


# Delete Test Network
TEST_NET=$(docker network ls -f name=$TESTNETNAME -q)
if [ -n "$TEST_NET" ]; then
	docker network rm -f $TEST_NET
	echo "delete test network"
else
	echo "not found test network..."
fi
