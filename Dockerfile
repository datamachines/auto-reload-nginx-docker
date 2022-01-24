FROM openresty/openresty:alpine-fat

MAINTAINER Annie Weng annieweng@datamachines.io

COPY ./monitor_nginx_config.sh /usr/local/bin/monitor_nginx_config.sh
COPY ./backgroundJob.sh /usr/local/bin/backgroundJob.sh


RUN mkdir /var/log/nginx
RUN apk add --no-cache openssl-dev
RUN apk add --no-cache git
RUN apk add --no-cache gcc
RUN luarocks install lua-resty-openidc

RUN chmod +x /usr/local/bin/*.sh

#RUN apk add  -y --no-install-recommends apt-utils
RUN apk add --no-cache  inotify-tools

# Setup monitor script run in the background and run nginx daemon.
CMD /usr/local/bin/backgroundJob.sh
