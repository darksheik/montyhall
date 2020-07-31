#!/usr/bin/perl


my $result = 0;
use constant TRIES => 1000000;
use constant DOORS => (0,1,2);

for ($i=0; $i < TRIES; $i++) {
  # Put the car behind a door
  my $doorpicked = int(rand(3));
  # Contestant picks a door
  my $contestantpick = int(rand(3));
  # Eliminate a door that does NOT have the car and that the contestant did not pick
  my $eliminate = otherdoor($doorpicked,$contestantpick);
  # Switch the door picked to to the other remaining door
  my $contestantpick = otherdoor($contestantpick,$eliminate);
  # Tally result
  if ($contestantpick == $doorpicked) { $result++; }
}

my $percent = 100 * $result / TRIES;
print "Won $result of " . TRIES . " times, $percent %\n";

sub otherdoor {
   my $door1 = $_[0];
   my $door2 = $_[1];

   my $result;
   foreach my $door (DOORS) {
      if ($door != $door1 && $door ne $door2) {
          $result = $door;
      }
   }
   return $result;
}
