#!/usr/bin/env bash


echo "optional env parameters:"
echo ">>>>>>>>>>>>>>>>>>>>>>>>"
cat conf/otter.properties  | grep -E "^\w" | awk '{print $1}' | sed 's/\./_/g' | awk '{print "CONF_"$0}' | while read _opts; do
    typeset -u _env_opts
    _env_opts="$_opts"
    echo "$_env_opts"
done
echo "<<<<<<<<<<<<<<<<<<<<<<<<"

_MYSQL_PORT="3306"

envs="MYSQL_HOST
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

