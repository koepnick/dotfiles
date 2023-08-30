#!/bin/bash

FILEPATH="$1"
#PID=$(cat ~/.local/imv/latest.pid)
PID=$(pgrep imv -n)
echo "PID: $PID"
if [[ -z $PID ]]
then
    echo "Not there"
    imv "$FILEPATH"
else
#    imv-msg $PID "close all"
    echo $PID "open '$FILEPATH'"
    #/usr/bin/imv-msg $PID "close all"
    /usr/bin/imv-msg $PID "open '$FILEPATH'"
    /usr/bin/imv-msg $PID goto -1
fi

