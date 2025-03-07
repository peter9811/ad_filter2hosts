#!/usr/bin/perl -w
#Source: https://newspaint.wordpress.com/2014/08/18/filtering-easylist-for-hosts-file-style-adblock/

#convert domains filters to hosts list with 0.0.0.0 IP
#Peter Cuevas. 4/04/2021
#Enhanced version

use strict;

my %hosts = ();
while (<>) {
    # Skip commented lines and empty lines
    next if /^\s*#/ || /^\s*!/ || /^\s*$/;
    
    # Extract domain from AdBlock/uBlock style rules: ||example.com^
    if ($_ =~ m/^\|\|([a-z][a-z0-9-_.]+\.[a-z]{2,})\^/) {
        $hosts{$1} = 1;
        next;
    }
    
    # Extract existing hosts entries: 0.0.0.0 example.com or 127.0.0.1 example.com
    if ($_ =~ m/^(0\.0\.0\.0|127\.0\.0\.1)\s+([a-z][a-z0-_.]+\.[a-z]{2,})\s*$/) {
        $hosts{$2} = 1;
        next;
    }
    
    # Extract plain domains
    if ($_ =~ m/^([a-z][a-z0-_.]+\.[a-z]{2,})\s*$/) {
        $hosts{$1} = 1;
        next;
    }
}

# Output in hosts file format
foreach my $host (sort keys %hosts) {
    print "0.0.0.0 $host\n";
}