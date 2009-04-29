use inc::Module::Install;

name     'URI-SmartURI';
all_from 'lib/URI/SmartURI.pm';
author   'Rafael Kitover <rkitover@cpan.org>';

perl_version '5.008001';

requires 'URI';
requires 'Class::C3::Componentised';
requires 'MRO::Compat' => '0.09';
requires 'File::Find::Rule';
requires 'List::Util';
requires 'List::MoreUtils';
requires 'Scalar::Util';
requires 'Moose';
requires 'namespace::clean';

if($] < 5.009_005) {
    requires 'Class::C3::XS' => '0.08';
    requires 'Class::C3' => '0.20';
}

build_requires 'Test::More';

WriteAll;
