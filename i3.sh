#!/bin/bash
set -e

i3 &

/bin/bash --login

wait -n

exit $?