#!/bin/bash
### debugging slim container run under podman (analog to cdebug exec for docker)
cont_name=${1:-php8}
podman run --rm -it --pod pod_lamp_host --name debugger --pid container:$(podman container ps |grep $cont_name |cut -d ' ' -f 1) -v ./cdebug.sh:/cdebug.sh docker.io/library/busybox sh -c "sh /cdebug.sh"
