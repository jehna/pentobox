FROM kalilinux/kali-rolling:arm64

RUN apt update

ENTRYPOINT bash --login $@
