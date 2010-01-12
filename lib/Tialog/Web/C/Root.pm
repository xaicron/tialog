package Tialog::Web::C::Root;
use Amon::Web::C;

sub index {
    render("list.mt", 'TOP', c->list);
}

sub list {
    (my $sub_title = c->request->path_info) =~ s|/\+|#|g;
    render("list.mt", $sub_title, c->list(1));
}

sub log {
    (my $sub_title = c->request->path_info) =~ s|/\+|#|g;
    $sub_title =~ s|/|<br />|g;
    render("log.mt", $sub_title, c->log, c->config->{keyword});
}

1;
