cd() {
    builtin cd "$@" && ls -l
}


# Create an array of commands to override
commands=("ps" "ss" "ip" "ping" "tail" "dig" "curl" "du" "df" "env" "docker" "jobs" "lsof" "nmap" "lsof" "lspci" "systemctl" "tcpdump" "ulimit" "vmstat" )

# For each command
for cmd in "${commands[@]}"; do
    # Use an "eval" command to create a function with the same name
    eval "
    $cmd() {
        if hash grc 2>/dev/null; then
            grc $cmd \"\$@\"
        else
            /usr/bin/$cmd \"\$@\"
        fi
    }
    "
done


# ps() {
#     if hash grc 2> /dev/null
#     then
#         grc ps "$@"
#     fi
# }
#
# ss() {
#     if hash grc 2> /dev/null
#     then
#         sudo grc ss "$@"
#     fi
# }
#
# ip() {
#     if hash grc 2> /dev/null
#     then
#         sudo grc ip "$@"
#     fi
# }
#
# ping() {
#     if hash grc 2> /dev/null
#     then
#         grc ping "$@"
#     fi
# }
#
# tail() {
#     if hash grc 2> /dev/null
#     then
#         grc tail "$@"
#     fi
# }
