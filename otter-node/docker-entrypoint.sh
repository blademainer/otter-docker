#!/usr/bin/env bash

_OTTER_MANAGER_ADDRESS=""
_MYSQL_PORT="3306"

envs="OTTER_MANAGER_ADDRESS
MSYQL_HOST
MYSQL_USER
MYSQL_PASSWORD
MYSQL_PORT
"

while read arg; do
    if [ "$(eval echo \$$arg)"x == ""x ]; then
        echo "env: $(eval echo $arg) could'nt be null!"
        exit 1
    fi
done <<< "$envs"

