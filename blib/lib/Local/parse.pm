package Local::parse;

use strict;
use warnings;

sub input_parse {
	my @library;
	while (<>) {
		chomp($_);
		my @str = split '/', $_;
		my $band = $str[1];

		my @tmp = split '-', $str[2];
		chop $tmp[0];
		my $year = $tmp[0];
		my $album = substr($tmp[1], 1);	
		@tmp = split '\.', $str[3];
		my $track = $tmp[0];
		my $format = $tmp[1];
		
		my %hash  = (
			'flag' => 0,
			'band' => $band, 
			'year' => $year, 
			'album' => $album, 
			'track' => $track, 
			'format' => $format
		);
		
		@library[$. - 1] = \%hash;
	}
	return \@library;
}
1;