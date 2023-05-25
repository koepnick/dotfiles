#!/bin/sh
swaymsg -t get_outputs | jq -r '.[] | {name} + .rect | "\(.x),\(.y) \(.width)x\(.height) \(.name)"'
