FROM ghcr.io/jehna/pentobox:main

USER root

RUN apt update -y
RUN DEBIAN_FRONTEND=noninteractive apt upgrade -y --fix-missing
RUN DEBIAN_FRONTEND=noninteractive apt full-upgrade -y --fix-missing
RUN apt purge -y
RUN apt autoremove -y

USER jehna

CMD /usr/share/bin/i3.sh