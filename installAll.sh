#!/bin/bash
# Searches $1(./) for all pom.xml files and tries to install them
if [ $1 ]
then
    dir=$1
else
    dir="./"
fi

for plugin in $(find $dir -iname "pom.xml" | sed -e "s/pom.xml//g")
do
    if [ ! -d "$plugin/target" ]
    then
        echo Installing plugin $(basename $plugin)
        mvn install -f $plugin
    fi
done
