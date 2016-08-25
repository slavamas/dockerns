#!/bin/bash
#@slavamas@gmail.com
#enter namespaces with this only script knowing only container name

#container name
cn=${1}

#container ID
cid=`docker ps | grep ${cn} | awk '{print $1}'`

#top level PID of container
tpid=`docker inspect ${cid} | grep Pid | head -1 | awk -F: '{print $2}' | sed -e 's/,//'`

#enter name space of that container
nsenter --target ${tpid} --mount --uts --ipc --net --pid
