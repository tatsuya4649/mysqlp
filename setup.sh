#!/bin/bash
# Setup Docker

function sudo_check(){
	if sudo -h > /dev/null 2>&1; then
		SUDO=sudo
	else
		SUDO=
	fi
}

function apt_check(){
	if ! apt -h ; then
		echo "not apt found"
		exit 1
	fi
}

sudo_check
apt_check

# docker install
$SUDO apt update && $SUDO apt install -y docker docker.io
#FIRSTUSER=$(whoami)
#$SUDO usermod -aG docker ${FIRSTUSER}
#$SUDO chgrp docker /var/run/docker.sock
#$SUDO systemctl restart docker
# install 
$SUDO apt install jq

