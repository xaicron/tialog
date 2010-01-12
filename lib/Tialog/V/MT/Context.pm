package Tialog::V::MT::Context;
use Amon::V::MT::Context;

use HTML::Entities qw/decode_entities/;
use URI::Escape ();
use JSON qw/to_json/;

sub clickable {
    my $text = shift;
    URI::Find->new(sub {
        my ($uri, $org) = @_;
        return qq|<a href="$uri" target="_blank">$org</a>|;
    })->find(\$text); 
    return $text;
}

1;
