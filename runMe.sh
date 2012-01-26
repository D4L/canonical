#!/bin/bash

echo "setting up..."
scriptdir="$(dirname "${BASH_SOURCE}")"
if [ ! -d $scriptdir/recovery ]; then
    mkdir $scriptdir/recovery
else
    rm -r $scriptdir/recovery
    mkdir $scriptdir/recovery
fi
home="$HOME"

echo "creating backup.. inside recovery..."
if [ -f $home/.bashrc ]; then
    mv $home/.bashrc $scriptdir/recovery
fi
if [ -f $home/.vimrc ]; then
    mv $home/.vimrc $scriptdir/recovery
fi
if [ -d $home/.vim ]; then
    mv -f $home/.vim $scriptdir/recovery
fi
if [ -d $home/.bashfunctions ]; then
    mv -f $home/.bashfunctions $scriptdir/recovery
fi

echo "copying our own files..."
cp $scriptdir/src/.bashrc $home
cp $scriptdir/src/.vimrc $home
cp -r $scriptdir/src/.vim $home
cp -r $scriptdir/src/.bashfunctions $home
