function cargo() {
    # Specify the path to your custom history file
    local HISTORY_FILE="/opt/cargo/.history"

    # Append the command to the custom history file
    echo "$(date +'%Y-%m-%d %H:%M:%S'): ${@}" >> "$HISTORY_FILE"

    # Execute the original command
    /home/skoepnick/.cargo/bin/cargo "${@}"
}

function pip() {
    # TODO: Inherit the variable from _path.sh
    local HISTORY_FILE="/opt/pip/.history"

    # Append the command to the custom history file
    echo "$(date +'%Y-%m-%d %H:%M:%S'): ${@}" >> "$HISTORY_FILE"

    # Execute the original command
    
    /usr/bin/pip "${@}"
}

function npm() {
    # TODO: Inherit the variable from _path.sh
    local HISTORY_FILE="/opt/npm/.history"

    # Append the command to the custom history file
    echo "$(date +'%Y-%m-%d %H:%M:%S'): ${@}" >> "$HISTORY_FILE"

    # Execute the original command
    
    
    /usr/bin/npm "${@}"
}
