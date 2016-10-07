package Local::mlib;

use strict;
use warnings;

use Local::tab; #!
#use Local::mlib_cmp; #!

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


sub get_columns_width {
	my $library = shift;
	my %col_width = (
			'band' => -1, 
			'year' => -1, 
			'album' => -1, 
			'track' => -1, 
			'format' => -1
		);
	for my $song (@$library) {
		for my $k (keys %col_width) {
		if (
			($song->{'flag'} == 1) &&
			(length(%$song{$k}) > ($col_width{$k} - 2) )
			) {
			$col_width{$k} = (length(%$song{$k}) + 2);
			}
		}
	}
	return \%col_width;
}

sub get_width_array {
	my $columns = shift;
	my $col_width_hash = shift;
	my @width_array;
	my $i = 0;
	for my $k (@$columns) {
		@width_array[$i++] = $$col_width_hash{$k};
	}
	return \@width_array;
}

sub print_lib {
	my $library = shift;
	my $columns = shift;
	my $col_width_hash = shift;
	my $col_width_array = shift;
	
	my $f = 0;
	print Local::tab::top_line($col_width_array);
	if ($Local::tab::no_print_flag) {return;}
	for my $song (@$library) {
		if ($song->{'flag'} == 1) {
			if ($f) {
				print Local::tab::middle_line($col_width_array);
			}
			$f = 1;
			Local::tab::print_row ($col_width_hash, $columns, $song);
		}
	}
	print Local::tab::botom_line($col_width_array);
}

sub sort_lib {
	my $library = shift;
	my $field = shift;
	for my $song (@$library) {

	}
}

sub lib {
	my $options = shift;
	my $columns = shift;
	my $field = shift;
	my $library = shift;

	my $output_song_count = 0;
	for my $song (@$library) {
		my $flag = 1;
		for my $k (keys %$options) {
			if ($k eq 'year') {
				if (
					(%$options{$k}) &&
					($options->{$k} != int(%$song{$k}))
					) {
					$flag = 0;
					last;
				}
			}
			else {
				if (
					(%$options{$k}) &&
					(%$options{$k} ne %$song{$k}) 
					) {
					$flag = 0;
					last;
				}
			}
		}
		$song->{'flag'} = $flag;
		if ($flag == 1) {$output_song_count++};
	}
	my $col_width_hash = get_columns_width ($library);
	my $col_width_array = get_width_array($columns, $col_width_hash);
	if ($field) {
		#print "$field!\n";
		if ($field eq 'album') {	
			@$library = sort mlib_cmp_album @$library;
		}
		if ($field eq 'band') {	
			@$library = sort mlib_cmp_band @$library;
		}
		if ($field eq 'format') {	
			@$library = sort mlib_cmp_format @$library;
		}
		if ($field eq 'track') {
			@$library = sort mlib_cmp @$library;
		}
		if ($field eq 'year') {	
			@$library = sort mlib_cmp_year @$library;
		}
	}

	if ($output_song_count) {
		print_lib (
			$library,
			$columns, 
			$col_width_hash, 
			$col_width_array
			);
	}
}
	
1;