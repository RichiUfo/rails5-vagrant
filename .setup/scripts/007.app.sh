#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
APP_PATH="/var/www/${APP_NAME}"

if [ "$(ls -A ${APP_PATH})" ]; then
   echo "============ ${APP_PATH} is not empty! ==================="
else
	su - www-data -c "n | rails new /var/www/${APP_NAME} --database=mysql"
fi

sed -i "s/Use Puma/Use Unicorn/" "${APP_PATH}/Gemfile"
sed -i "s/gem 'puma', '~> [0-9\.]*'/gem 'unicorn'/" "${APP_PATH}/Gemfile"

sed -i "s/password: *$/password: ${MYSQL_ROOT_PASS}/" "${APP_PATH}/config/database.yml"
sed -i "s/${APP_NAME}_development/${APP_NAME}/" "${APP_PATH}/config/database.yml"

su - www-data -c "cd ${APP_PATH}/ && bundle install"

cp "${DIR}/../app/unicorn.rb" "${APP_PATH}/config/unicorn.rb"

mkdir "${APP_PATH}/shared"
mkdir "${APP_PATH}/shared/pids"
mkdir "${APP_PATH}/shared/log"

sudo service unicorn_${APP_NAME} start
