#!/usr/bin/env bash

DIR="/var/www/.setup/scripts/"
SCRIPT=""

if [ "$SCRIPT" != "" ]; then
    echo "[MOBIO SH Scripts]: Run one script: ${DIR}${SCRIPT}"
    echo "***"
    echo "[MOBIO SH Scripts]: ${SCRIPT} [START]"
    . ${DIR}${SCRIPT}
    echo "[MOBIO SH Scripts]: ${SCRIPT} [START]"
else
    echo "[MOBIO SH Scripts]: Iterate all scripts"
    for file in ${DIR}*; do
      echo "***"
      echo "[MOBIO SH Scripts]: ${file} [START]"
      . ${file}
      echo "[MOBIO SH Scripts]: ${file} [END]"
    done
fi
