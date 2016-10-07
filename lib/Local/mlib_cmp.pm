package Local::mlib_cmp;

use strict;
use warnings;
sub mlib_cmp_album {
	return $a->{'album'} cmp $b->{'album'};
}
sub mlib_cmp_band {
	return $a->{'band'} cmp $b->{'band'};
}
sub mlib_cmp_format {
	return $a->{'format'} cmp $b->{'format'};
}
sub mlib_cmp_track {
	return $a->{'track'} cmp $b->{'track'};
}
sub mlib_cmp_year {
	return int($a->{'year'}) <=> int($b->{'year'});
}

1;