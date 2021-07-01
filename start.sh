#!/bin/bash

# install docker and etc application 
source ./setup.sh

# MySQL Server Setup
cd scripts
./build.sh
./run.sh

cd ../test
# MySQL Test Setup
# Build Test Container, And RUN.
# And Python MySQL Test scripts.
test/testd.sh
# End Test,And Delete Test Container
test/testend.sh
