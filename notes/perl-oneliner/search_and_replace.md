Perl-oneliner: search and replace in files



with xargs and pie

find . | xargs perl -p -i -e 's/something/else/g'
