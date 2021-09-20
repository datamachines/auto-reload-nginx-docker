FROM nginx:latest

MAINTAINER Annie Weng annieweng@datamachines.io

COPY ./monitor_nginx_config.sh /usr/local/bin/monitor_nginx_config.sh
RUN chmod +x /usr/local/bin/monitor_nginx_config.sh

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install inotify-tools -y

# Setup cron to automatically re-load the NGINX configuration daily.
CMD /usr/local/bin/monitor_nginx_config.sh& && nginx -g "daemon off;"
