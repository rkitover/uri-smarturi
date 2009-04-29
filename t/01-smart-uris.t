#!perl

use strict;
use warnings;
use Test::More tests => 8;

use URI::SmartURI;
use URI;

my $uri = URI::SmartURI->new('http://www.catalystframework.org/calendar',
    { reference => 'http://www.catalystframework.org/' }
);

is($uri, 'http://www.catalystframework.org/calendar', 'stringification');

is($uri->hostless, '/calendar', '$uri->hostless');

ok($uri->hostless->eq('/calendar'), '$uri->eq 1');
ok($uri->hostless->eq(URI::SmartURI->new('/calendar', 'http')), '$uri->eq 2');
ok($uri->hostless->eq(URI->new('/calendar', 'http')), '$uri->eq 3');

is($uri->relative, 'calendar', '$uri->relative');

is($uri->absolute, 'http://www.catalystframework.org/calendar', '$uri->absolute');

is(
    $uri->relative->absolute->hostless->relative->absolute,
    'http://www.catalystframework.org/calendar',
    'sticky reference URI'
);

# vim: expandtab shiftwidth=4 ts=4 tw=80:
