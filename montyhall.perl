#!/usr/bin/perl


my $result = 0;
my $tries = 100000;

for ($i=0; $i<$tries; $i++) {
  # Put the car behind a door
  my $doorpicked = int(rand(3));
  # Contestant picks a door
  my $contestantpick = int(rand(3));
  my $origpick = $contestantpick;
  # Eliminate a door that does NOT have the car and that the contestant did not pick
  my $eliminate = $doorpicked;
  while ($eliminate == $doorpicked || $eliminate == $contestantpick) {
   $eliminate = int(rand(3));
  }
  # Switch the door picked to to the other remaining door
  if ($contestantpick == 0) {
    if ($eliminate == 1) { $contestantpick = 2; }
    if ($eliminate == 2) { $contestantpick = 1; }
  } elsif ($contestantpick == 1) {
    if ($eliminate == 0) { $contestantpick = 2; }
    if ($eliminate == 2) { $contestantpick = 0; }
  } else {
    if ($eliminate == 0) { $contestantpick = 1; }
    if ($eliminate == 1) { $contestantpick = 0; }
  }

  # Tally result
  if ($contestantpick == $doorpicked) { $result++; }
}

my $percent = 100 * $result/$tries;
print "Won $result of $tries times, $percent %\n";
