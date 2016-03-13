#!/bin/sh

cwd=$(pwd)

dev=$HOME/dev

[ -d "$dev" ] || mkdir -p "$dev" 


trash=$dev/trash
[ -d "$trash" ] || mkdir $trash



for f in *; do
	if [ -d "$f" ];  then

	case $f in
	*_files) 
		for ff in $f/*; do
			[ -e "$ff" ] || continue
			bn=$(basename $ff)
            		[ -z $bn ] && continue
			t="$trash"/$(date +"%Y%m%d%M%S")
			[ -d "$t" ] || mkdir -p  $t
			[ -e "$HOME/.$bn" ] && { mv $HOME/.$bn $t/ ; }
			rm -rf $HOME/.$bn
			ln -s 	$cwd/$ff $HOME/.$bn
		done
	;;
	*_dir) 
		bn=$(basename $f)
       	name=${bn%_*}
		rm -rf $HOME/.$name
        ln -s $cwd/$f $HOME/.$name
	;;
	*_config_indir)  # non destructive sub folders under ~/.config
		bn=$(basename $f)
      mname=${bn%_*}
      name=${mname%_*}
		sdir=$HOME/.config/$name
		[ -d "$sdir" ] || mkdir $sdir 
        for ff in $f/*; do
            bff=$(basename $ff)
            [ -e "$ff" ] || continue
            rm -rf  $sdir/$bff
           ln -s 	$cwd/$ff $sdir/$bff

        done
      ;;
	*_indir)  # non destructive sub folders
		bn=$(basename $f)
      name=${bn%_*}
		sdir=$HOME/.$name
		[ -d "$sdir" ] || mkdir $sdir 
        for ff in $f/*; do
            bff=$(basename $ff)
            [ -e "$ff" ] || continue
            rm -rf  $sdir/$bff
           ln -s 	$cwd/$ff $sdir/$bff

        done
	;;
	*_config)  # destructive sub folders under ~/.config
		bn=$(basename $f)
        name=${bn%_*}
		sdir=$HOME/.config/$name

        rm -rf $sdir
        ln -s $cwd/$f $sdir

	;;
	*)
        echo "Err: unknown action for $f"
        exit 1;
	;;
	esac
else
        [ "$f" = 'install.sh' ] && continue
        [ "$f" = 'README.txt' ] && continue
		rm -f $HOME/.$f
		ln -s $cwd/$f $HOME/.$f
		rm -f $HOME/r/.$f
		ln -s $cwd/$f $HOME/r/.$f
fi
done

for df in ~/.* ; do
	bdf=$(basename $df)
 [ -e "$df" ] || continue 
 [ "$bdf" = '.'  ] && continue 
 [ "$bdf" = '..'  ] && continue 
  	rm -rf "$dev/$bdf"
  ln -s "$df" "$dev"/
done
