#!/bin/bash
set -e

yes | docker pull ghcr.io/jehna/pentobox:main
yes | docker image prune
yes | docker container prune
yes | docker volume prune
yes | docker system prune
