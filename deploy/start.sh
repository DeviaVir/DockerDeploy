#!/bin/sh
containercount=$(/usr/bin/docker ps -a | awk '$1 != "CONTAINER" { n++ }; END { print n+0 }');
if [ "$containercount" != "0" ]
then
  if [ -f "/opt/deploydocker" ];
  then
    OUTPUT=$(/opt/deploydocker);
    echo $OUTPUT;
  fi
  
  /usr/bin/docker rmi $(docker images -f 'dangling=true' -q);
  
  exit 0;
fi
