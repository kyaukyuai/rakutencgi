package Logger;

use warnings;
use strict;
use Date;

sub new {
  my $class = shift;
  my ($file_handle) = @_;
  $file_handle = *STDOUT unless $file_handle;

  my $self = {
    file_handle => $file_handle
  };
  return bless $self, $class;
}

sub info {
  my ($self, $log) = @_;
  my ($YYYY, $MM, $DD) = Date->get_today();
  print {$self->{file_handle}} "[INFO] $YYYY$MM$DD $log\n";
  return 1;
}

sub error {
  my ($self, $log) = @_;
  my ($YYYY, $MM, $DD) = Date->get_today();
  print {$self->{file_handle}} "[ERROR] $YYYY$MM$DD $log\n";
  return 1;
}

1;
