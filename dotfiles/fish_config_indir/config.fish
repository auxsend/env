#fish_vi_mode

set OPAM_HOME "/home/ben/.opam/system/bin"
test -d $OPAM_HOME; and set PATH $OPAM_HOME $PATH

# AUX
set aux $HOME/aux

set -g SHELL fish

set shlib $aux/shlib
[ -f $shlib/aliases.fish ] ; and . $shlib/aliases.fish
[ -f $shlib/functions.fish ] ; and . $shlib/functions.fish


# keychain (ssh, gpg)
#  keychain --eval --quiet -Q id_rsa auxsend_rsa
if status --is-interactive
  keychain --eval --quiet -Q auxsend_mallrats_160207 mallrats_160212 auxsend_mallrats_151128 
end

#if status --is-interactive;
    #keychain --nogui --clear 
#  keychain --eval   --quiet -Q ~/.ssh/auxsend_acer.rsa 35827ADE
  #keychain --quiet --nogui ~/.ssh/auxsend_acer.rsa 35827ADE

  #[ -e $HOME/.keychain/$HOSTNAME-fish ]; and . $HOME/.keychain/$HOSTNAME-fish
  #[ -e $HOME/.keychain/$HOSTNAME-fish-gpg ]; and . $HOME/.keychain/$HOSTNAME-fish-gpg

#end


# PATH
test -d "/bin"; and set PATH "/bin"
test -d "/sbin"; and set PATH "/sbin" $PATH
test -d "/usr/bin"; and set PATH "/usr/bin" $PATH
test -d "/usr/sbin"; and set PATH "/usr/sbin" $PATH
test -d "/usr/local/bin"; and set PATH "/usr/local/bin" $PATH
test -d "/usr/local/sbin"; and set PATH "/usr/local/sbin" $PATH

test -d "$HOME/local/bin"; and set PATH "$HOME/local/bin" $PATH
test -d "$HOME/.opam/system/bin"; and set PATH "$HOME/.opam/system/bin" $PATH



# bin: user commands
test -d "$aux/usr/bin"; and set PATH "$aux/usr/bin" $PATH
# sbin: sys commands
test -d "$aux/usr/sbin"; and set PATH "$aux/usr/sbin" $PATH
# my toolssss
test -d "$aux/tools/bin"; and set PATH "$aux/tools/bin" $PATH

# opt: third party stuff 
test -d "$aux/opt/bin"; and set PATH "$aux/opt/bin" $PATH
# apps: gui stuff
test -d "$aux/apps/bin"; and set PATH "$aux/apps/bin" $PATH
# edi
test -d "$aux/edi/bin"; and set PATH "$aux/edi/bin" $PATH

# Bin; directory that holds all kinds of links
test -d "$aux/Bin"; and set PATH "$aux/Bin" $PATH


# GLOBALS
set -g -x VISUAL vim
set -g -x EDITOR vim
set -g -x PAGER less
set -g -x DOCHOME ~/docs

set -gx CAML_LD_LIBRARY_PATH "/home/ben/.opam/4.02.3/lib/stublibs"
set -gx MANPATH ":/home/ben/.opam/4.02.3/man" $MANPATH
#set -gx PERL5LIB "/home/ben/.opam/4.02.3/lib/perl5" $PERL5LIB
set -gx OCAML_TOPLEVEL_PATH "/home/ben/.opam/4.02.3/lib/toplevel"
set -gx PATH "/home/ben/.opam/4.02.3/bin" $PATH



