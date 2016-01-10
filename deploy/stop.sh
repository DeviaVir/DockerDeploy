#!/bin/sh
containercount=$(/usr/bin/docker ps -a | awk '$1 != "CONTAINER" { n++ }; END { print n+0 }');
if [ "$containercount" != "0" ]
then
  /usr/bin/docker stop `/usr/bin/docker ps --no-trunc -aq`
fi
