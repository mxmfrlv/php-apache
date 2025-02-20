#!/bin/bash
### debugging slim container run under docker
cont_name=${1:-php8}
pod_name=${2:-pod_lamp_host}
dbg_img_name=${3:-docker.io/mxmfrlv/busybox-php-curl}
cid=$(docker container ps |grep $cont_name |head -1 |cut -d ' ' -f 1)
docker run --rm -it --name debugger --pid container:$cid --network host --pid container:$cid -v ./cdebug.sh:/cdebug.sh $dbg_img_name sh -c "sh /cdebug.sh"
