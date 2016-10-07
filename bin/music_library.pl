use Local::mlib;
use Local::args;
use Local::parse;
use strict;
use warnings;
Local::mlib::lib (
	Local::args::args_parse(), 
	Local::parse::input_parse()
	);


