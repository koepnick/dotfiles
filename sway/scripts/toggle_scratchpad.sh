#!/bin/bash

# Get the id of the focused window
dunstify "HI"
focused=$(swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.focused and .pid) | .id')
echo "--------------------"
echo $focused
notify-send $focused
echo "--------------------"

# Check if the focused window is in the scratchpad
# not_in_scratchpad=$(swaymsg -t get_tree | jq -r '.. | select(.name? == "__scratch") | .. | (.nodes? // empty)[] | select(.id == '$focused') | .id')

if [[ -z ${focused} ]]
then
    echo "1"
else
    echo "2"
fi
# if [ "$in_scratchpad" = "$focused" ]; then
#     # If the window is in the scratchpad, move it to the current workspace and remove custom styles
#     swaymsg "[con_id=$focused]" border normal
#     swaymsg "[con_id=$focused]" move workspace current
# else
#     # If the window is not in the scratchpad, change its style and move it to the scratchpad
#     swaymsg "[con_id=$focused]" border pixel 10
#     swaymsg "[con_id=$focused]" move scratchpad
# fi
#
