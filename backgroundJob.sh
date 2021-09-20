#!/bin/bash
nohup bash /usr/local/bin/monitor_nginx_config.sh  &
nginx -g "daemon off;"

