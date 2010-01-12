package Tialog::V::MT;
use Amon::V::MT -base;

use URI::Find ();
use HTML::Entities qw/decode_entities/;

sub clickable {
    my $text = shift;
    URI::Find->new(sub {
        my ($uri, $org) = @_;
        return qq|<a href="$uri" target="_blank">$org</a>|;
    })->find(\$text); 
    return $text;
}


1;
