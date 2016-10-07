use Local::mlib;
use Local::args;
use Local::parse;
#require 'parse.pm';
#require 'tab.pm';
#require 'args.pm';
#require 'mlib.pm';
use strict;
use warnings;
Local::mlib::lib (
	Local::args::args_parse(), 
	Local::parse::input_parse()
	);


