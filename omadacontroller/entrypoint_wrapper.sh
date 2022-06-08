#!/bin/bash

for d in data work logs
do
    echo $d
    mkdir -p /config/omada/$d
    #mkdir -p /opt/tplink/EAPController/$d
    rm -rf /opt/tplink/EAPController/$d
    ln -sfn /config/omada/${d} /opt/tplink/EAPController
done

echo "${@}"

source /entrypoint_orig.sh
