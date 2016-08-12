#!/usr/bin/env bash

DIR="/var/www/.setup/scripts/"

for file in ${DIR}*; do
  echo "***"
  echo "[MOBIO SH Scripts]: ${file} [START]"
  . ${file}
  echo "[MOBIO SH Scripts]: ${file} [END]"
done
