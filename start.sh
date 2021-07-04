#!/bin/bash

# install docker and etc application 
if [ -z "$1" ]; then
	source ./setup.sh
else
	echo "DEBUG Mode"
fi

# MySQL Server Setup
cd scripts
source ./build.sh
source ./run.sh

cd ../test
# MySQL Test Setup
# Build Test Container, And RUN.
# And Python MySQL Test scripts.
source ./testd.sh
# End Test,And Delete Test Container
source ./testend.sh
