#!/bin/sh

cwd=$(pwd)

self=$(basename $cwd)

aux=$HOME/aux

[ -d "$aux" ] || mkdir -p $aux 


rm -f $aux/$self
ln -s $cwd $aux/$self


# Links to ~/aux
for item in notepad.md dotfiles edi shlib ; do
    rm -f $aux/$item
    ln -s $cwd/$item $aux/$item
done



#for a in aliases/*; do
    #[ -f $a ] || continue
    #b=$(basename $a)
    #rm -f $HOME/.$b
    #ln -s $cwd/$a $HOME/.$b
#done
