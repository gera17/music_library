package Local::args;

use strict;
use warnings;

use Getopt::Long;
sub args_parse {
		GetOptions (
		'band=s' => \my $band,
		'year=s' => \my $year, 
		'album=s' => \my $album,
		'track=s' => \my $track,
		'format=s' => \my $format,
		'sort=s' => \my $field,
		'columns=s' => \my $columns_arg
		);
	my @columns;
	if (defined $columns_arg){
		@columns = split /,/, $columns_arg;
	}
	else {
		@columns = ('band', 'year', 'album', 'track', 'format');
	}
	for my $it (@columns) {$it = lc $it};
	my %hash = (
		'band' => $band, 
		'year' => $year, 
		'album' => $album, 
		'track' => $track, 
		'format' => $format,
		);
	return (\%hash, \@columns, $field);
}

1;
