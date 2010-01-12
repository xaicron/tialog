use Tialog::Web;
use Plack::Builder;
use File::Spec;
use File::Basename qw/dirname/;

my $config = do File::Spec->catfile(dirname(__FILE__), 'config.pl') or die "cannot load configuration file";
$config->{keyword} ||= [];

builder {
    enable 'Static',
        path => qr{^/static/|^/favicon.ico},
        root => './htdocs/';
    enable_if { $config->{auth} } 'Auth::Digest',
        authenticator => sub { $config->{auth}->{$_[0]} }, secret => 'DanKogai';
    Tialog::Web->to_app(config => $config);
};
