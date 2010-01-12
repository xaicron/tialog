? my ($sub_title, $list) = @_;
? extends 'base.mt';
? block title => 'tialog';
? block sub_title => $sub_title;
? block content => sub {
<ul>
?   for my $channel (@$list) {
        <li><a href="<?= uri_for($channel->{uri}) ?>"><?= $channel->{name} ?></a></li>
?   }
</ul>
? };
