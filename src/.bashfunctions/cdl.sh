#!/bin/bash
cd $1 && gnome-terminal --title=$(readlink -f ./) -x sh -c "ls && sleep 2;" ;
