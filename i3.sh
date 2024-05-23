#!/bin/bash
set -e

sudo xmodmap -e "clear Mod1"
sudo xmodmap -e "clear Mod2"
sudo xmodmap -e "add Mod1 = Meta_L"

i3 &

/bin/bash --login

wait -n

exit $?