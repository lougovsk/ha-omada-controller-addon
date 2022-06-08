#!/bin/bash

for d in data work logs
do
   mkdir -p /config/omada/$d
   cp -a /config/omada/$d/. /opt/tplink/EAPController/$d/
done

source /entrypoint_orig.sh

/backup.sh
