#!/bin/sh
containercount=$(/usr/bin/docker ps -a | awk '$1 != "CONTAINER" { n++ }; END { print n+0 }');
if [ "$containercount" != "0" ]
then
  if [ -f "/opt/hooks/pull" ];
  then
    /opt/hooks/pull
  fi
  OUTPUT=$(/usr/bin/docker images | awk '{print $1}' | xargs -L1 /usr/bin/docker pull);
  if [ -f "/opt/hooks/pulled" ];
  then
    /opt/hooks/pulled
  fi
  exit 0;
fi
