#!/bin/bash

#Checks to see if we have the extra files and scripts that we need


if $(type swayr &> /dev/null)
then
    dunstify "Swayr exists"
else
    dunstify "Not exists"
fi
