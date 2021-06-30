#!/bin/bash

function apt_check{
	if !apt; then
		exit 1
	fi
}

function python_install{
	$SUDO apt update && $SUDO apt install -y python3-pip

	if [ -f /bin/python3 ]; then
		$SUDO ln -s /bin/python3 /bin/python
	else
		echo "not found in /bin/python3..."
		exit 1
	fi
}

if sudo; then
	SUDO=sudo
else
	SUDO=
fi

apt_check
python_install

# Python file
./$TESTFILE
