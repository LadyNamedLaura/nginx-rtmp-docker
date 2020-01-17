FROM debian:buster
RUN apt-get update && apt-get install --allow-unauthenticated -y nginx libnginx-mod-rtmp gettext-base
COPY nginx.conf.template /etc/nginx/nginx.conf.template


VOLUME /srv/recordings

EXPOSE 1935/tcp
EXPOSE 1935/udp

ENTRYPOINT ["/bin/bash", "-c", "envsubst < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && exec nginx"]
