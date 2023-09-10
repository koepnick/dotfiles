#!/bin/bash
# exec rm -f /tmp/sovpipe && mkfifo /tmp/sovpipe && tail -f /tmp/sovpipe | sov -t 500
#systemctl --user start avizo
#systemctl --user start kanshi
pgrep -x waybar || waybar > ~/.local/logs/waybar.log &
pgrep -x avizo-service || avizo-service > ~/.local/logs/avizo.log &
pgrep -x wl-paste || wl-paste --watch cliphist store > ~/.local/logs/wl-paste.log &

pgrep -x pia-client || /opt/piavpn/bin/pia-client > ~/.local/logs/pia-client.log &
pgrep -x wireguird || /opt/wireguird/wireguird > ~/.local/logs/wireguird.log &
pgrep -x kdeconnect-indicator || kdeconnect-indicator > ~/.local/logs/kdeindicator.log &
pgrep -x seafile-applet || seafile-applet > ~/.local/logs/seafile-client.log &

pgrep -x dunst || dunst > ~/.local/logs/dunst.log &
pgrep -x kanshi || kanshi > ~/.local/logs/kanshi.log &
pgrep -x flashfocus || flashfocus  > ~/.local/logs/flashfocus.log &
pgrep -x protonmail-bridge || protonmail-bridge > ~/.local/logs/protonmail-bridge.log &
