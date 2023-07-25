#!/bin/bash

# Filename Width Height (both in characters/columns)
# echo $1 $2 $3 $4
$(~/.local/python/bin/python3 ~/.config/vifm/preview.py "${1}")
img2sixel /tmp/preview.png
#mediainfo "${1}"
# img2sixel /tmp/preview.png
#~/.config/vifm/scripts/sixel /tmp/preview.png 100 100
#~/.config/vifm/scripts/sixel /tmp/preview.png 100 100
