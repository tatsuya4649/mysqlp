#!/bin/bash
if [ -f ../VERSION ]; then
	VERSION=$(cat ../VERSION)
else
	echo "not found VERSION file"
	exit 1
fi
