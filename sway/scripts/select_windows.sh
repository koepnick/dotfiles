swaymsg -t get_tree | jq -r '.. | (.nodes? // empty)[] | select(.pid and .visible) | {name} + .rect | "\(.x),\(.y) \(.width)x\(.height) \(.name)"'
