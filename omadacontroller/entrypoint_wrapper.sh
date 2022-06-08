#!/bin/bash

for d in data work logs
do
   mkdir -p /config/omada/$d
   cp -a /config/omada/$d/. /opt/tplink/EAPController/$d/
done

#first fixing db????
rm -f -- /opt/tplink/EAPController/data/db/mongod.lock
mongod --dbpath /opt/tplink/EAPController/data/db --repair

source /entrypoint_orig.sh
