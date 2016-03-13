package Double::Colon ;

use Cwd q|abs_path|;

sub ::fuck {
    print "fffu\n";
}

sub ::sentaku {
    my $cmd = shift;

    qx($cmd | bash $ENV{HOME}/.utils/lib/sentaku.sh);
}

     
1;
