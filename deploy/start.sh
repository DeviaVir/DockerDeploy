#!/bin/sh
containercount=$(/usr/bin/docker ps -a | awk '$1 != "CONTAINER" { n++ }; END { print n+0 }');
if [ "$containercount" != "0" ]
then
  /usr/bin/docker rm `/usr/bin/docker ps --no-trunc -aq`
  
  if [ -f "/opt/deploydocker" ];
  then
    OUTPUT=$(/opt/deploydocker);
    echo $OUTPUT;
    exit 0;
  fi
  
  if [ -f "/opt/hooks/start" ];
  then
    /opt/hooks/start
  fi
  
  exit 1;
fi
