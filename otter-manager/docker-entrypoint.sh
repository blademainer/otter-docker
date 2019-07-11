#!/usr/bin/env bash


echo "optional env parameters:"
echo ">>>>>>>>>>>>>>>>>>>>>>>>"
cat conf/otter.properties  | grep -E "^\w" | awk '{print $1}' | sed 's/\./_/g' | awk '{print "CONF_"$0}' | while read _opts; do
    _env_opts="`echo $_opts | tr [a-z] [A-Z]`"
    echo "$_env_opts"
done
echo "<<<<<<<<<<<<<<<<<<<<<<<<"



env | grep -E "^CONF_" | while read conf; do
    name=`echo "$conf" | awk -F "=" '{print $1}' | sed 's/CONF_//' | sed 's/_/\./g' `
    value=`echo "$conf" | awk -F "=" '{print $2}'`
    c="`echo $name | tr [A-Z] [a-z]`"
    echo "setting: $c = ${value}"
    sed -i "s/^${c}\s*=.*$/${c} = ${value}/g" conf/otter.properties
#    sed -i "s/$c/$V"
done

bin/startup.sh

tail -f /dev/null
