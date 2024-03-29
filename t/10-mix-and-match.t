# $Id: $

use strict;
use Test::More tests => 6;
use XML::Feed;


my $afeed  = XML::Feed->new('Atom');
my $rfeed  = XML::Feed->new('hAtom');
my $atom   = make_entry('Atom');
my $rss    = make_entry('hAtom');


ok($afeed->add_entry($atom), "Added Atom entry to Atom feed");
ok($afeed->add_entry($rss),  "Added hAtom  entry to Atom feed");

ok($rfeed->add_entry($rss),  "Added hAtom  entry to hAtom feed");
ok($rfeed->add_entry($atom), "Added Atom entry to hAtom feed");



is(scalar $afeed->entries, 2, 'Now 2 entries in Atom feed');
is(scalar $rfeed->entries, 2, 'Now 2 entries in hAtom  feed');

sub make_entry {
    my $format = shift;
    my $entry  = XML::Feed::Entry->new($format);
    $entry->title("Test Title ".rand());
    $entry->content("Foo");
    $entry->summary("Bar");
    return $entry;
}
