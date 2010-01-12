package Tialog::Web;
use Amon::Web -base => (
    default_view_class => 'MT',
    base_class         => 'Tialog',
);

sub list {
    my ( $c, $reverse ) = @_;
    my ( $dir, $path ) = $c->uri2path;
    
    my $sort_cb = $reverse ? sub { $b cmp $a } : sub { $a cmp $b };
    opendir my $dh, $dir or die "$dir: $!";
    return [
        map {
            my $file = $_;
            s/#/+/g;
            { name => $file, uri => "$path/$_" };
        } sort { $sort_cb->() } grep !/^\.{1,2}$/ => readdir $dh
    ];
}

sub log {
    my ( $c ) = @_;
    my ( $file ) = $c->uri2path;
    
    open my $fh, '<:utf8', $file or die "$file: $!";
    my @list = sort {$b cmp $a} map {
        s/[[:cntrl:]]//smg;
        s/<#[^>]+:([^>]+)>/[$1]/;
        s/>#[^<]+:([^<]+)</[$1]/;
        $_;
    } grep !/^\d{2}:\d{2}:\d{2} (?:[+!-] |[\w_-]+ -> [\w_-]+$)/ => <$fh>;
    return \@list;
}

sub uri2path {
    my $c = shift;
    (my $path_info = $c->request->path_info) =~ s|/$||;
    my $path = $c->config->{log_path} . $path_info;
    $path =~ s/\+/#/g;
    return ($path, $path_info);
}

1;
