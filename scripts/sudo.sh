#!/bin/bash

if sudo -h >/dev/null 2>&1; then
	SUDO=sudo
else
	SUDO=
fi
