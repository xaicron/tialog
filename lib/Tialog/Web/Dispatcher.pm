package Tialog::Web::Dispatcher;
use Amon::Web::Dispatcher::HTTPxDispatcher;

connect '/'                 => { controller => 'Root', action => 'index' };
connect '/[^/]+'            => { controller => 'Root', action => 'list' };
connect '/[^/]+/[^/]+\.txt' => { controller => 'Root', action => 'log' };

1;
