#!/bin/bash
# Setup Docker

function sudo_check(){
	if sudo -h ; then
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
$SUDO apt update && $SUDO apt install docker docker.io
$SUDO usermod -aG docker ${USER}
# install 
$SUDP apt install jq

