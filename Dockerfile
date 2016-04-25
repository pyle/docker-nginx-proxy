# Reverse proxy container to be used with a static configuration file location
# Config location is mounted at /proxy
FROM nginx

MAINTAINER Adam Pyle <admpyle@gmail.com>

# ENV variables/ can be overridden
ENV LOG_DIR=/gluster/vol1/proxy
ENV ERR_LOG_TYPE=warn

# Remove any default configuration
RUN rm /etc/nginx/conf.d/*.conf

ADD nginx/nginx.conf /etc/nginx/
ADD nginx/default.conf /etc/nginx/conf.d/
ADD start.sh /usr/src

EXPOSE 80 443

WORKDIR /usr/src

ENTRYPOINT ./start.sh
