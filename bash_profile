#!/bin/bash

# Makes my terminal ocnfig Ubuntu compatible, until I patch the original repo

#if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
alias jenv=':'
source ~/.config/bash/main.bash
cd /work || exit
PS1="👺$PS1"
PATH="$PATH:/root/go/bin"
