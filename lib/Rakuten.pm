package Rakuten;

use strict;
use warnings;
use XML::Simple;
use LWP::Simple;
use Encode;
use URI;
use Data::Dumper;

sub KeywordHotelSearch {
=pod
  my $param = shift(@_);
  print Dumper $param;
  my $DEVELOPER_ID = "bfc5bca21a7bac85a197a29ebeab80dd";
  my $AFFILIATE_ID = "0e2a74f8.b705f347.0e2a74f9.ce1173da";
  my $API_BASE_URL = "http://api.rakuten.co.jp/rws/3.0/json";
  my $uri = URI->new($API_BASE_URL);
  print Dumper $uri;

  $uri->query_form(
    developerId => $DEVELOPER_ID,
    affiliateId => $AFFILIATE_ID,
    operation   => "KeywordHotelSearch",
    version     => "2009-10-20",
    keyword     => encode("utf8", $param),
  );
#  my $response = get($uri);
#  return $response;
=cut
} 
