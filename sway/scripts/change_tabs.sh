#!/bin/bash

# Get the focused window's ID
focused=$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .id')

# Focus the first window in the workspace
swaymsg '[workspace=__focused__] focus child'

# Switch the container to tabbed layout
swaymsg 'layout tabbed'

# Move the originally focused window to the first container
swaymsg "[con_id=$focused] move to workspace __focused__; move left"

