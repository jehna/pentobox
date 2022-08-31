#!/bin/bash
set -e

yes | docker pull ghcr.io/jehna/pentobox:main
yes | docker image prune > /dev/null
yes | docker container prune > /dev/null
yes | docker volume prune > /dev/null

IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + "$IP" > /dev/null

clear
docker run --rm -ti --privileged -e DISPLAY="$IP:0" -e XSOCK=/tmp/.X11-unix -e XAUTHORITY=/.Xauthority -v /tmp/.X11-unix:/tmp/.X11-unix -v ~/.Xauthority:/.Xauthority --network host -v "$PWD"/work:/work ghcr.io/jehna/pentobox:main

xhost - > /dev/null