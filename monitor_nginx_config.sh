#!/bin/bash
###########
#monitor nginx folder, and reload nginx if detecth create/modify/delete event
while true
do
 inotifywait --exclude .swp -r  -e create -e modify -e delete -e move /etc/nginx
 nginx -t
 if [ $? -eq 0 ]
 then
  echo "Detected Nginx Configuration Change"
  echo "Executing: nginx -s reload"
  nginx -s reload
 fi
done
