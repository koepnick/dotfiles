#!/bin/bash
# exec rm -f /tmp/sovpipe && mkfifo /tmp/sovpipe && tail -f /tmp/sovpipe | sov -t 500
#systemctl --user start avizo
#systemctl --user start kanshi
pgrep -x waybar || /usr/bin/waybar > ~/.local/logs/waybar.log &
pgrep -x avizo-service || /usr/bin/avizo-service > ~/.local/logs/avizo.log &

pgrep -x pia-client || /opt/piavpn/bin/pia-client > ~/.local/logs/pia-client.log &
pgrep -x wireguird || /opt/wireguird/wireguird > ~/.local/logs/wireguird.log &
pgrep -x kdeconnect-indicator || /usr/bin/kdeconnect-indicator > ~/.local/logs/kdeindicator.log &
pgrep -x seafile-applet || /usr/bin//seafile-applet > ~/.local/logs/seafile-client.log &

pgrep -x dunst || /usr/local/bin/dunst > ~/.local/logs/dunst.log &
pgrep -x kanshi || /usr/local/bin/kanshi > ~/.local/logs/kanshi.log &
pgrep -x flashfocus || /usr/bin/flashfocus  > ~/.local/logs/flashfocus.log &
pgrep -x protonmail-bridge || /usr/bin/protonmail-bridge > ~/.local/logs/protonmail-bridge.log &
