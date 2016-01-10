#!/bin/sh
/usr/bin/docker start `/usr/bin/docker ps --no-trunc -aq`
