#!/bin/bash

CACHE_DIR=~/.local/thumbs
echo ${1}

if [[ ${2} == "move" ]]
then
    mv "${1}" ${CACHE_DIR}/Thumbs.db
else
    cp "${1}" ${CACHE_DIR}/Thumbs.db
fi
mkdir -p ${CACHE_DIR}
rm -rf ${CACHE_DIR}/output
foremost -t jpeg,png -d -a ${CACHE_DIR}/Thumbs.db -o ${CACHE_DIR}/output

python ~/.config/convenience_scripts/unthumb.py /tmp/montage.png # ${CACHE_DIR}/output/jpg

swayimg /tmp/montage.png # ${CACHE_DIR}/output/jpg/montage.png
