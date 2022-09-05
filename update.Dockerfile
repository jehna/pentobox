FROM ghcr.io/jehna/pentobox:main

USER root

RUN apt update -y
RUN apt upgrade -y
RUN apt full-upgrade -y
RUN apt purge -y
RUN apt autoremove -y

USER jehna

CMD /usr/share/bin/i3.sh