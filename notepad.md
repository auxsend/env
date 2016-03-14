Env - my work environment
=========================


Read [sources](htmlsrc)

Releases in [archive](archive)


### urxvt

search window with urxvt and vifm 

> urxvtc -geometry 130x30 -e bash -c "vifm -f /home/ben/.vim/"



### Tools

menu tools:
    https://github.com/garybernhardt/selecta

    choose xsel over xlip because of error "  Error: target STRING not available" when starting script from tmux.conf.

### Tmux
    Name of the current session:
    tmux display-message -p '#S'

### Vim

    open file read-only: vim -R

    remote files:
        new server: vim –servername SERVER file1.txt

        open file in this remote server:
            vim –servername SERVER –remote-tab file2.txt file3.txt

### ubuntu

encrease the sound volume:
    amixer -D pulse sset Master 5%+

### X11

reload .Xresources: 
    xrdb -merge .Xresources


### Bash

#### Case
    case $foo in
        bar)
            echo "bb"
        ;;
        *)
            echo "dddefault"
        ;;
    esac
    
#### remove whitespace

    tr -d ' '
   

### Vimperator

show navigation toolbar
    :set gui=navigation

[ hashpass ](site/hashpass.html)

### fish shell


    ls | while read -l f  ;  echo $f; end
or
    for i in *; echo $i ; end 
filecheck
    if -f notepad.txt ; echo "jsdf"; end⏎


### perl

* remove all newlines

    $line =~ s/\R//g;

or before 5.10

    $line =~ s/\015?\012?$//;


* file slurp 

    open(my $f, '<', $filename) or die "Err $filename: $!\n";
    $string = do { local($/); <$f> };
    close($f);




### markdown

[md](rsc/markdown/markdown.md)
[txt](rsc/markdown/markdown.txt)
[html](rsc/markdown/markdown/index.html)


## NOTEPAD

### rsync

    rsync -avz -e "ssh" . plainxt.org:

    exclude with: --exclude '*\.git'

    - "plainxt.org" is in ~/.ssh/config
    - don't forget the colon
    - a: archive, z: compress, v: verbose

## chiselapp

    Anonymous Cloning: $ fossil clone https://chiselapp.com/user/auxsend/repository/env env.fsl
    Authenticated Cloning: $ fossil clone https://auxsend@chiselapp.com/user/auxsend/repository/env env.fsl


## fossil 

    fossil settings ignore-glob "*.o,*.obj,*.exe,*/fishd.*,*/*_history " --global


## Ssh / gpg

    password for ssh keys are cached with [keychain](http://www.funtoo.org/Keychain)

    how can I check my ssh password: ssh-keygen -y -f /mykey.rsa
        this is printing the public key

    Add ssh to ssh-agent 

        ssh-add ~/.ssh/mykey


## ubuntu

localization, change language etc: 

    sudo vim /etc/default/locale 

## firefox

disable super annoying mouse wheel zooming

    > about:config
    > mousewheel.with_meta.action 
    > 0

set url for new tab
    > about:config
    > browser.newtab.url


## date

date "+%y.%m.d%"

## tricks

which process runs on port

    sudo netstat -lpn | grep :8080

untar tar.xz file
    tar -xJf file.pkg.tar.xz

change password of ssh key

     ssh-keygen -f id_dsa -p


## Filename & Extension

    filename=$(basename "$fullfile")
    extension="${filename##*.}"
    filename="${filename%.*}"


## Docker

    # du -sh /var/lib/docker/*
        695M    /var/lib/docker/aufs
        628K    /var/lib/docker/containers
        80K     /var/lib/docker/execdriver
        500K    /var/lib/docker/graph
        24M     /var/lib/docker/init
        12K     /var/lib/docker/linkgraph.db
        4.0K    /var/lib/docker/repositories-aufs
        4.0K    /var/lib/docker/tmp
        8.0K    /var/lib/docker/trust
        4.0K    /var/lib/docker/volumes

### Nearlyfreespeech

    how to turn on file index
        .htaccess file for that directory: Options +Indexes
fossil clone ssh://repos.auxsend.org//home/public/env.fossil env.fossil
### Setup a luks based container

    dd if=/dev/urandom of=(pwd)/localvault_mallrats.luks  bs=1M count=1000
    sudo cryptsetup -y luksFormat ./localvault_mallrats.luks
    sudo cryptsetup luksOpen ./localvault_mallrats.luks  localvault
    sudo mkfs.ext4 -j /dev/mapper/localvault
    sudo mkdir /media/localvault
    sudo mount /dev/mapper/localvault  /media/localvault

And the unmount process

    sudo cryptsetup luksClose /dev/mapper/localvault
    sudo umount /dev/mapper/localvault

### Git

#### workflow with multiple accounts

in ~/.ssh/config:
  
    Host github.com-auxsend 
        HostName github.com
        User git
        IdentityFile ~/.ssh/auxsend_github

    in local .git/config

        git@github.com-auxsend:auxsend/gambit.git


#### Forking workflow (simple)

    - fork repo in github
    - clone local copy
    - create branch
          git checkout -b perlb
    - after editing, and commit, do push to branch
        git push origin perlb


### Luks

sudo cryptsetup luksClose /dev/mapper/locsecvault
sudo umount /media/localvault
