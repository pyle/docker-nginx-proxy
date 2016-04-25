#! /bin/sh
# NGINX reverse proxy starter
# Maps configuration files from the /proxy/config directory to the proper nginx
# configuration path (/etc/nginx/)
# Reads directory as follows:
# /proxy/config/nginx.conf gets symlinked to /etc/nginx/nginx.conf
# Items in /proxy/confg/conf.d/ get symlinked to the /etc/nginx/conf.d/ directory


extraConfigDir="/proxy/confg/conf.d/"
nginxConfD="/etc/nginx/conf.d/"
# Check if extraConfigDir has configurations and then link the folder
if [ "$(ls -A $extraConfigDir)"]; then
  echo "Linking your configuration files"
  ln -s $extraConfigDir $nginxConfD
else
  echo "No extra config, default confiuration is set"
fi

# Check if the nginx.conf file exists and link it
if [ "$(ls -A /proxy/config/nginx.conf)"]; then
  echo "Adding your nginx.conf file"
  rm /etc/nginx/nginx.conf
  ln -s /proxy/config/nginx.conf /etc/nginx/nginx.conf
echo "Starting Nginx"
nginx -g 'daemon off;'
