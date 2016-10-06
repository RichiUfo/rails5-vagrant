#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_UNICORN_CONFIG="/etc/init.d/unicorn_${APP_NAME}"

rm ${APP_UNICORN_CONFIG}

cp ${DIR}/../unicorn/unicorn_app $APP_UNICORN_CONFIG
sed -i "s/{app}/$APP_NAME/" $APP_UNICORN_CONFIG 

sudo chmod 755 ${APP_UNICORN_CONFIG}
sudo update-rc.d unicorn_${APP_NAME} defaults

echo "
sudo service unicorn_${APP_NAME} start
" >> .bash_login
