#!/bin/bash
nohup bash /usr/local/bin/monitor_nginx_config.sh  &
/usr/local/openresty/nginx/sbin/nginx -g "daemon off;"

