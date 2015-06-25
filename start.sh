#!/bin/bash

num=$1

if [ -z $num ]
then
    num=3
fi

# Start ambari server
cid=$(docker run -d --privileged=true -p 18080:8080 ambari /scripts/bootstrap.sh server)
server_ip=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${cid})
sleep 100

# Start ambari client
for i in $(seq $num);
do
    docker run -d --privileged=true -e AMBARI_SERVER=$server_ip ambari
done
