#!perl -w

print "1..6\n";

# Test mixing of URI::SmartURI and URI::SmartURI::WithBase objects
use URI::SmartURI '-import_uri_mods';
use URI::SmartURI::WithBase;
use URI::SmartURI::URL;

$str = "http://www.sn.no/";
$rel = "path/img.gif";

$u  = URI::SmartURI->new($str);
$uw = URI::SmartURI::WithBase->new($str, "http:");
$uu = URI::SmartURI::URL->new($str);

sub Dump
{
   require Data::Dumper;
   print Data::Dumper->Dump([$a, $b, $c, $d], [qw(a b c d)]);
}

$a = URI::SmartURI->new($rel, $u);
$b = URI::SmartURI->new($rel, $uw);
$c = URI::SmartURI->new($rel, $uu);
$d = URI::SmartURI->new($rel, $str);

#Dump();
print "not " unless $a->isa("URI::SmartURI") &&
                    ref($b) eq ref($uw) &&
                    ref($c) eq ref($uu) &&
                    $d->isa("URI::SmartURI");
print "ok 1\n";

print "not " if $b->base && $c->base;
print "ok 2\n";

$a = URI::SmartURI::URL->new($rel, $u);
$b = URI::SmartURI::URL->new($rel, $uw);
$c = URI::SmartURI::URL->new($rel, $uu);
$d = URI::SmartURI::URL->new($rel, $str);

print "not " unless ref($a) eq "URI::SmartURI::URL" &&
                    ref($b) eq "URI::SmartURI::URL" &&
                    ref($c) eq "URI::SmartURI::URL" &&
                    ref($d) eq "URI::SmartURI::URL";
print "ok 3\n";

print "not " unless ref($b->base) eq ref($uw) &&
                    $b->base eq $uw &&
                    ref($c->base) eq ref($uu) &&
                    $c->base eq $uu &&
                    $d->base eq $str;
print "ok 4\n";



$a = URI::SmartURI->new($uu, $u);
$b = URI::SmartURI->new($uu, $uw);
$c = URI::SmartURI->new($uu, $uu);
$d = URI::SmartURI->new($uu, $str);

#Dump();
print "not " unless ref($a) eq ref($b) &&
                    ref($b) eq ref($c) &&
                    ref($c) eq ref($d) &&
                    ref($d) eq ref($u);
print "ok 5\n";

$a = URI::SmartURI::URL->new($u, $u);
$b = URI::SmartURI::URL->new($u, $uw);
$c = URI::SmartURI::URL->new($u, $uu);
$d = URI::SmartURI::URL->new($u, $str);

print "not " unless ref($a) eq "URI::SmartURI::URL" &&
                    ref($b) eq "URI::SmartURI::URL" &&
                    ref($c) eq "URI::SmartURI::URL" &&
                    ref($d) eq "URI::SmartURI::URL";
print "ok 6\n";
