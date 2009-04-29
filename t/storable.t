#!perl -w

eval {
    require Storable;
    print "1..3\n";
};
if ($@) {
    print "1..0 # skipped: Needs the Storable module installed\n";
    exit;
}

system($^X, "-Iblib/lib", "-Ilib", "t/storable-test.pl", "store");
system($^X, "-Iblib/lib", "-Ilib", "t/storable-test.pl", "retrieve");

unlink('urls.sto');
