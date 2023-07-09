#!/bin/sh
DUNSTIFY_ARGS="script"
APP_ID=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .app_id')
echo $APP_ID > /tmp/appid
if [[ ${APP_ID} != "null" ]]
then
    dunstify ${DUNSTIFY_ARGS} "\n\nAppId: ${APP_ID}"
else
    CLASS=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .window_properties | .class')
    INSTANCE=$(swaymsg -t get_tree | jq '.. | select(.type?) | select(.focused==true) | .window_properties | .instance')
    dunstify ${DUNSTIFY_ARGS} "\n\nX11 Window\nClass:\t\t${CLASS}\nInstance:\t${INSTANCE}"
fi
