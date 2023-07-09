#!/bin/bash

REPOS=( \
    https://github.com/roosta/tmux-fuzzback \
    https://github.com/tmux-plugins/tmux-yank \
)

OFS=${IFS}
IFS=' '
for repo in ${REPOS[@]}
do
    # printf "%s" $repo
    title=${repo##*/}
    if [[ ! -d $title ]]
    then
        git clone $repo
    fi
done
IFS=$OFS

