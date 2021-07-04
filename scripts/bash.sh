#!/bin/bash
# execute mynginx bash
source ./gcontid.sh
source ./sudo.sh
# get container id
gcontid
docker exec -it $CONTAINER_ID "/bin/bash" 
