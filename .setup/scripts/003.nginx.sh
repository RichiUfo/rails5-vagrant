#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_NGINX_CONFIG="/etc/nginx/sites-available/${APP_NAME}"

apt-get install -y nginx

rm /etc/nginx/sites-available/*
cp ${DIR}/../nginx/* $APP_NGINX_CONFIG

sed -i "s/{app}/$APP_NAME/" $APP_NGINX_CONFIG 
mkdir /var/www/${APP_NAME}

rm /etc/nginx/sites-enabled/*
ln -s /etc/nginx/sites-available/* /etc/nginx/sites-enabled/

service nginx restart
