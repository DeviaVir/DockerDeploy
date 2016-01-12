#!/bin/sh
containercount=$(/usr/bin/docker ps -a | awk '$1 != "CONTAINER" { n++ }; END { print n+0 }');
if [ "$containercount" != "0" ]
then
  OUTPUT=$(/usr/bin/docker images | awk '{print $1}' | xargs -L1 /usr/bin/docker pull);
  echo "Up2date";
fi
