? my ($sub_title, $list, $keyword) = @_;
? extends 'base.mt';
? block title => 'tialog';
? block sub_title => $sub_title;
? block head => sub {
    <script type="text/javascript">__KEYWORD = <?= encoded_string to_json $keyword ?>;</script>
? };
? block footer => sub {
    <script type="text/javascript" src="<?= uri_for('/static/js/color.js') ?>"></script>
? };
? block content => sub {
            <ul>
?           for my $line (@$list) {
                <li><?= encoded_string  clickable decode_entities $line ?></li>
?           }
            </ul>
? };
