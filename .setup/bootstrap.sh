#!/usr/bin/env bash
APP_NAME='profile'
DIR="/var/www/.setup/scripts/"
MYSQL_ROOT_PASS="root"

for file in ${DIR}*; do
  echo "***"
  echo "[SH Scripts]: ${file} [START]"
  . ${file}
  echo "[SH Scripts]: ${file} [END]"
done
