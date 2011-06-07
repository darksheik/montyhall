#!/usr/bin/perl


my $result = 0;
my $tries = 100000;

for ($i=0; $i<$tries; $i++) {
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

my $percent = 100 * $result/$tries;
print "Won $result of $tries times, $percent %\n";

sub otherdoor {
   my @doors = (0,1,2);
   my $door1 = $_[0];
   my $door2 = $_[1];

   my $result;
   foreach my $door (@doors) {
      if ($door != $door1 && $door ne $door2) {
          $result = $door;
      }
   }
   return $result;
}