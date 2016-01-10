#!/bin/sh
/usr/bin/docker images | awk '{print $1}' | xargs -L1 /usr/bin/docker pull
