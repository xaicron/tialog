<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title><? block title => 'Amon' ?></title>
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <meta http-equiv="Content-Script-Type" content="text/javascript" />
    <link href="<?= uri_for('/static/css/main.css') ?>" rel="stylesheet" type="text/css" media="screen" />
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">google.load("jquery", "1.3");</script>
?   block head => ''
</head>
<body>
    <div id="Container">
        <h1>
            <a href="<?= uri_for('/') ?>"><? block sub_title => 'TOP' ?></a>
        </h1>
        <div id="Content">
?   block content => 'body here'
        </div>
        <div id="FooterContainer">
          <p id="Footer">Powered by Amon</p>
        </div>
    </div>
    <script type="text/javascript" src="<?= uri_for('/static/js/back.js') ?>"></script>
?   block footer => ''
</body>
</html>
