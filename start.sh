#!/bin/bash
set -e

yes | docker image prune
yes | docker container prune
yes | docker volume prune
yes | docker system prune

IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + "$IP" > /dev/null

clear
docker run --rm -ti --privileged -e DISPLAY="$IP:0" -e XSOCK=/tmp/.X11-unix -v /tmp/.X11-unix:/tmp/.X11-unix --network host -v "$PWD"/work:/work ghcr.io/jehna/pentobox:main

xhost - > /dev/null