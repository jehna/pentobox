FROM ghcr.io/jehna/pentobox:main

RUN apt update -y
RUN apt upgrade -y
RUN apt full-upgrade -y
RUN apt purge -y
RUN apt autoremove -y

ENTRYPOINT bash --login $@