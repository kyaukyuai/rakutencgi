use warnings;
use strict;
use Test::More;
use lib "/var/monitor/lib";

plan (tests => 9);

use_ok("Date");

foreach my $test (
  sub {
    my $date = Date->new();
    can_ok($date, "get_today"); 
    can_ok($date, "get_yesterday"); 
    can_ok($date, "get_tomorrow"); 
    can_ok($date, "get_date"); 
    my ($YYYY, $MM, $DD) = 0;
    ($YYYY, $MM, $DD) = $date->get_today();
    like("$YYYY$MM$DD", qr/\d{8}/, "this date should be YYYYMMDD");
    ($YYYY, $MM, $DD) = $date->get_yesterday();
    like("$YYYY$MM$DD", qr/\d{8}/, "this date should be YYYYMMDD");
    ($YYYY, $MM, $DD) = $date->get_tomorrow();
    like("$YYYY$MM$DD", qr/\d{8}/, "this date should be YYYYMMDD");
    ($YYYY, $MM, $DD) = $date->get_date(-1);
    like("$YYYY$MM$DD", qr/\d{8}/, "this date should be YYYYMMDD");
  }
) { $test->(); }
done_testing();

1;
