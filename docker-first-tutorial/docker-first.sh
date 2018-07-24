#!/bin/bash
NAME=$1
USER=$2

if [ "$#" -ne 1 ]; then
   echo "wrong number of argments"
fi

docker pull ubuntu

docker run --name test-lamp-server -it ubuntu:latest bash -c 'sudo apt-get update; echo "root" | sudo apt-get install lamp-server^'
#NAME full name, USER docker repo hub  
docker commit -m "Added lamp server" -a "${NAME}" test-lamp-server ${USER}/test-lamp-server:latest
docker login
docker push ${USER}/test-lamp-server  
