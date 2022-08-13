#!/bin/bash

# Makes my terminal ocnfig Ubuntu compatible, until I patch the original repo

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
alias jenv=':'
mkdir -p /opt/homebrew/bin
touch /opt/homebrew/bin/brew
chmod +x /opt/homebrew/bin/brew
source ~/.config/bash/main.bash
cd /work || exit
PS1="👺$PS1"
PATH="$PATH:/root/go/bin"
[ -z "$TMUX" ] && tmux -u