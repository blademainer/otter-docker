#!/usr/bin/env bash

echo "optional env parameters:"
echo ">>>>>>>>>>>>>>>>>>>>>>>>"
cat conf/env.conf  | grep -E "^\w" | awk '{print $1}' | sed 's/\./_/g' | awk '{print "CONF_"$0}' | while read _opts; do
    echo "opts: $_opts"
#    typeset -u _env_opts
    _env_opts="`echo $_opts | tr [a-z] [A-Z]`"
    echo "$_env_opts"
done
echo "<<<<<<<<<<<<<<<<<<<<<<<<"


env | grep -E "^CONF_" | while read conf; do
    name=`echo "$conf" | awk -F "=" '{print $1}' | sed 's/CONF_//' | sed 's/_/\./g' `
    value=`echo "$conf" | awk -F "=" '{$1=""; print $0}'`
    c="`echo $name | tr [A-Z] [a-z]`"
    echo "setting: $c = ${value}"
    sed -i "s~^${c}~s*=.*$/${c} = ${value}~g" conf/env.conf
#    sed -i "s/$c/$V"
done


while read field; do
    if [ -z "`echo "$field" | grep -E '^\w'`" ]; then
        continue
    fi
    echo "field: $field"
    name="`echo $field | awk -F '=' '{print $1}' | sed 's/\./_/g' | awk '{print "CONF_"$0}' | tr [a-z] [A-Z] | sed 's/ //g'`"
    value="`echo $field | awk -F '=' '{$1=""; print $0}' | sed 's/^\s*//g' | sed 's/\"//g' `"
    echo "name: $name value: $value"
    export $name="$value"
#    echo "$exp"
#    eval $exp
done < conf/env.conf

echo "effect envs: "
echo ">>>>>>>>>>>>>>>>>>>>>>>>"
env | grep "CONF"
echo "<<<<<<<<<<<<<<<<<<<<<<<<"
