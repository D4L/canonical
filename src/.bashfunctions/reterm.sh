#!/bin/bash

if [ $1 ]
then
    TEMP="gnome-terminal -x "
    LECOM="gnome-terminal"
    for (( a = 0; a != $1 - 1; a++ ))
    do
        LECOM=$TEMP$LECOM
    done
    $LECOM;
    exit
else
    gnome-terminal && exit ;
fi
