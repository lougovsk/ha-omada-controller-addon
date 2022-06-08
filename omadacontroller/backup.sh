#!/bin/bash

for d in data work logs
do
   cp -a /opt/tplink/EAPController/$d/. /config/omada/$d/
done
