#!/bin/bash

source ./port.sh
source ./version.sh
source ./docker_name.sh
source ./datadir.sh
source ./net.sh

cd ..

ENVFILE="ENV"
VIND="-v $PWD/myconf/conf.d:/etc/mysql/conf.d"
if [ -n "$DATADIR" ];then
	VIND="$VIND -v $DATADIR:/var/lib/mysql"
else
	VIND="$VIND"
fi
echo $VIND
$SUDO docker run --network $TESTNETNAME --name $DOCKER_NAME --env-file $ENVFILE $VIND -it -d -p $HOSTPORT:$PORT $DOCKER_NAME:$VERSION
