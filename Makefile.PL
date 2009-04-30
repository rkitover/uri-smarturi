use inc::Module::Install;

name     'URI-SmartURI';
all_from 'lib/URI/SmartURI.pm';
author   'Rafael Kitover <rkitover@cpan.org>';

perl_version '5.008001';

requires 'URI';
requires 'Class::C3::Componentised';
requires 'File::Find::Rule';
requires 'List::Util';
requires 'List::MoreUtils';
requires 'Scalar::Util';
requires 'Moose';
requires 'namespace::clean';

build_requires 'Test::More';

WriteAll;
