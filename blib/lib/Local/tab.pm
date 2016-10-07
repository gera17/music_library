package Local::tab;

use strict;
use warnings;
our $no_print_flag = 0;
sub top_line {
	my $output_line;
	my $count = 0;
	my $col_width = shift;
	for my $i (@$col_width) {
		$count += $i + 1;
	}
	if ($count == 0) {
		$no_print_flag = 1;
		return;
	}
	$output_line = "/".'-'x($count-1).q'\\'; 
	#как напечатать бэкслэш без пробела?
	
	return $output_line."\n";
}

sub middle_line {
	my $output_line;
	$output_line = "|";
	my $col_width = shift;
	for my $count (@$col_width) {
		$output_line .= '-'x$count.'+';
	}
	chop($output_line);
	return $output_line."|\n";
}

sub botom_line {
	my $output_line;
	my $count = 0;
	my $col_width = shift; 
	for my $i (@$col_width) {
		$count += $i + 1;
	}
	$output_line = '\\'.'-'x($count-1)."/\n"; 
	return $output_line;
}

sub print_field {
	my $width = shift;
	my $field = shift;
	my $space_count = $width - length($$field) - 1;
	print ' 'x$space_count;
	print "$$field ";
	return $width;
}

sub print_row {
	my $col_width_hash = shift;
	my $columns = shift;
	my $song = shift;

	for my $col (@$columns) {
		print "|";
		print_field ($col_width_hash->{$col}, \($song->{$col}));
	}
	print "|\n";
}

1;
