#!/bin/sh
containercount=$(/usr/bin/docker ps -a | awk '$1 != "CONTAINER" { n++ }; END { print n+0 }');
if [ "$containercount" != "0" ]
then
  /usr/bin/docker rm `/usr/bin/docker ps --no-trunc -aq`
  
  if [ -f "/opt/deploydocker" ];
  then
    OUTPUT=$(/opt/deploydocker);
    echo $OUTPUT;
  fi
  
  exit 0;
fi
