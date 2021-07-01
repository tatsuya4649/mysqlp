#!/bin/bash

# install docker and etc application 
source ./setup.sh

# MySQL Server Setup
scripts/build.sh
scripts/run.sh

# MySQL Test Setup
# Build Test Container, And RUN.
# And Python MySQL Test scripts.
test/testd.sh
