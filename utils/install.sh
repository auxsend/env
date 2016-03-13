#!/bin/sh


tools=$HOME/tools


rm -f $HOME/.utils
ln -s $(pwd) $HOME/.utils

[ -d "$tools" ] || mkdir $tools


rm -f $tools/utilsbin

ln -s $(pwd)/bin $tools/utilsbin


