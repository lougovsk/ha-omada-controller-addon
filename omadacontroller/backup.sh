#!/bin/bash

# we need to stop db to avoid corruption
mongod --dbpath /opt/tplink/EAPController/data/db --shutdown
for d in data work logs
do
   cp -a /opt/tplink/EAPController/$d/. /config/omada/$d/
done
