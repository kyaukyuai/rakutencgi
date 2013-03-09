#!/usr/bin/perl
use strict;
use warnings;
use XML::Simple;
use LWP::Simple;
use Encode;
use URI;
use Data::Dumper;
use CGI;
use Rakuten;

# CGI Configuration
my $cginame = 'rakuten_travel.cgi';
my $TITLE   = '楽天トラベルキーワードサーチAPI';

# Rakuten Webservice Copy Right
my $webservice = <<"EOF";
<!-- Rakuten Web Service Attrubution Snippet FROM HERE -->
<a href="http://webservice.rakuten.co.jp/" target="_blank">
<img src="http://webservice.rakuten.co.jp/img/credit/200709/credit_22121.gif" border="0" alt="楽天ウェブサービスセンター" title="楽天ウェブサービスセンター" width="221" height="21"/></a>
<!-- Rakuten Web Service Attribution Snippet TO HERE -->
EOF

# CGI Parameters
my $q = new CGI;
my $keyword = $q->param('keyword');

# Rakuten Webservice API
my $rakuten = new Rakuten();
my $rakutenhotels = $rakuten->keyword_hotel_search("品川 ホテル");

foreach my $rakutenhotel (@$rakutenhotels) {
  print Dumper $rakutenhotel;
}

# Display Page
print "Content-Type: text/html\n\n";
print <<"EOF";
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Language" content="ja" />
<title>$TITLE</title>
</head>
<body>
</body>
</html>
EOF

exit(0);
