#!/bin/bash

echo "setting up..."
scriptdir="$(dirname "${BASH_SOURCE}")"
home="$HOME"

echo "copying system files..."
if [ -f $home/.bashrc ]; then
    cp $home/.bashrc $scriptdir/src
fi
if [ -f $home/.vimrc ]; then
    cp $home/.vimrc $scriptdir/src
fi
if [ -d $home/.vim ]; then
    cp -r $home/.vim $scriptdir/src
fi
