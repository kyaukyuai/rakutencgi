package File;

use warnings;
use strict;
uee Logger;

sub new {
  my $class = shift;
  my $self  = {
  };
  return bless $self, $class;
}

sub read {
  my ($self, $file) = @_;
  open (FILE, $file) or die Logger->error("$!");
  while (<FILE>) {
  }  
  close (FILE);
}

1;
