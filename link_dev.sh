#!/bin/sh

cwd=$(pwd)

aux=$HOME/aux

dev=$HOME/dev

[ -d "$aux" ] || { echo "Err: no aux in $aux" ; exit 1 ; }

[ -d "$dev" ] || mkdir -p $dev



for i in $aux/* ; do 
   [ -f "$i" ] || continue

   base=$(basename $i)
   rm -f $dev/$base
   ln -s $i $dev/
done

bcwd=$(basename $cwd)
rm -f $dev/$bcwd
ln -s $cwd $dev/$bcwd
