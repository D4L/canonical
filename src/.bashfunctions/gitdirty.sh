#!/bin/bash
st=$(git status 2>/dev/null | tail -n 1)
if [[ $st != "nothing to commit (working directory clean)" ]]
then
    echo " + "
fi
