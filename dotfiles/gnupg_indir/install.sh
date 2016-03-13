#!/bin/sh


for i in *.conf ; do
    rm -f ~/.gnupg/$i
    cat $i > ~/.gnupg/$i
done

