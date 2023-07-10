#!/bin/bash
# exec rm -f /tmp/sovpipe && mkfifo /tmp/sovpipe && tail -f /tmp/sovpipe | sov -t 500
systemctl --user start avizo
systemctl --user start kanshi
/sbin/waybar &
/opt/piavpn/bin/pia-client &
/opt/wireguird/wireguird &
/usr/bin/kdeconnect-indicator &
