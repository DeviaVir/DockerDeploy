#!/bin/sh
containercount=$(/usr/bin/docker ps -a | awk '$1 != "CONTAINER" { n++ }; END { print n+0 }');
if [ "$containercount" != "0" ]
then
  if [ -f "./hooks/deregister_from_elb.sh" ];
  then
    chmod +x ./hooks/deregister_from_elb.sh
    ./hooks/deregister_from_elb.sh
  else
    echo "deregister hook not found ${PWD##*/}";
  fi
  /usr/bin/docker stop `/usr/bin/docker ps --no-trunc -aq`
fi
