use inc::Module::Install;
all_from "lib/Tialog.pm";

tests 't/*.t t/*/*.t t/*/*/*.t';
requires 'Amon';
requires 'URI::Find';
requires 'HTML::Entities';

recursive_author_tests('xt');
auto_set_repository;
auto_install;

WriteAll;
