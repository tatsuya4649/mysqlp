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
	exit 0
else
	echo "not found test image..."
	exit 1
fi

