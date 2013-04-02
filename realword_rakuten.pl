#!/usr/bin/perl
use strict;
use warnings;
use LWP::Simple;
use XML::Simple;
use HTML::TreeBuilder;
use Encode qw(encode_utf8); 
binmode STDOUT,":utf8";
use URI;
use Data::Dumper;
use Rakuten;

# Rakuten Webservice API
my $rakuten = new Rakuten();

my $file = "/var/www/html/data/realtime.txt";
my $items;

open(my $fh, "<", $file)
  or die "Cannot open $file: $!";

my $count = 1;

while(my $line = readline $fh) {

  chomp $line;

  $items = $rakuten->item_search($line);
  
  XMLout($items, Noattr=>1, OutputFile=>"$..xml");
=pod
  unlink "rakuten_$count.txt";

  open(FILE, ">> rakuten_$count.txt");
  
  my $output;
  foreach my $item (@$items) {
    my $input = {
      'item' => { 
        'itemName' => $item->{itemName},
        'mediumImageUrl' => $item->{mediumImageUrl},
        'affiliateUrl' => $item->{affiliateUrl},
        'itemPrice' => $item->{itemPrice}
      } 
    };
    $output .= $input;
#    print FILE $output;
  }

  XMLout($output, NoAttr=>1, OutputFile=>'a.xml');
  #print FILE $last;
  
  close(FILE);

  $count++;
=cut
}
