package Rakuten;

use strict;
use warnings;
use XML::Simple;
use LWP::Simple;
use Encode;
use URI::Escape;
use Data::Dumper;

sub new {
  my $class = shift;
  my $self  = {
  };

  return bless $self, $class;
}

sub keyword_hotel_search {
  my ($self, $param) = @_;
  my $DEVELOPER_ID = "bfc5bca21a7bac85a197a29ebeab80dd";
  my $AFFILIATE_ID = "0e2a74f8.b705f347.0e2a74f9.ce1173da";
  my $API_BASE_URL = "http://api.rakuten.co.jp/rws/3.0/rest";
  my $uri = URI->new($API_BASE_URL);

  $uri->query_form(
    developerId => $DEVELOPER_ID,
    affiliateId => $AFFILIATE_ID,
    operation   => "KeywordHotelSearch",
    version     => "2009-10-20",
    keyword     => $param,
  );
  my $response = get($uri);
  my $xml = new XML::Simple;
  my $rakuten_xml = $xml->XMLin($response);
  return $rakuten_xml->{Body}->{'KeywordHotelSearch:KeywordHotelSearch'}->{hotel};
} 

1;
