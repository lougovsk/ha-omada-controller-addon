#!/bin/bash

for d in data work logs
do
    mkdir -p /config/omada/$d
    ln -s /opt/tplink/EAPController/$d /config/omada/$d 
done

source /entrypoint.sh
