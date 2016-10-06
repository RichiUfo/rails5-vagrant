#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

debconf-set-selections <<< "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASS"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASS"

apt-get install -y mysql-server libmysqlclient-dev mysql-client

for file in ${DIR}/../mysql/*; do
    echo '[RUNNING MYSQL COMMANDS]'
    COMMAND=$(sed -e "s/{app}/$APP_NAME/" ${file})
    echo ${COMMAND}
    if [[ "$MYSQL_ROOT_PASS" == "" ]]; then
        mysql -uroot -e ${COMMAND}
    else
        mysql -uroot -p${MYSQL_ROOT_PASS} -e "${COMMAND}"
    fi
done

sed -i "s/^bind-address/#bind-address/" /etc/mysql/my.cnf
service mysql restart
