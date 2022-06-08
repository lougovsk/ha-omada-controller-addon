#!/usr/bin/env bash
set -x

for d in data work logs
do
   mkdir -p /config/omada/$d
   cp -a /config/omada/$d/. /opt/tplink/EAPController/$d/
done

pid=0

# SIGTERM-handler
term_handler() {
  echo "SIGTERM HANDLER"
  if [ $pid -ne 0 ]; then
    kill -SIGTERM "$pid"
    wait "$pid"
    echo "Making back up"
    for d in data work logs
    do
      echo "Copying " $d 
      cp -a /opt/tplink/EAPController/$d/. /config/omada/$d/
    done
  fi
  exit 143; # 128 + 15 -- SIGTERM
}

# setup handlers
# on callback, kill the last background process, which is `tail -f /dev/null` and execute the specified handler
trap 'kill ${!}; term_handler' SIGTERM

# run application
/entrypoint_orig.sh "${@}" &
pid="$!"

# wait forever
while true
do
  tail -f /dev/null & wait ${!}
done
