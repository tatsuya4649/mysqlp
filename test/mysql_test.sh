#!/bin/bash

TESTFILE=mytest.py

function apt_check (){
	$SUDO apt -h
	if [[ $? != 0 ]]; then
		exit 1
	fi
}

function python_install (){
	$SUDO apt update && $SUDO apt install -y python3-pip

	if [ -f /usr/bin/python3 ]; then
		$SUDO ln -s /usr/bin/python3 /bin/python
	else
		echo "not found in /usr/bin/python3..."
		ls /bin
		exit 1
	fi
}

if sudo -h; then
	SUDO=sudo
else
	SUDO=
fi

apt_check
python_install

# Python file
pip3 install -r ./requirements.txt

if python ./$TESTFILE; then
	echo "Success MySQL Test"
else
	echo "Failure MySQL Test"
fi

