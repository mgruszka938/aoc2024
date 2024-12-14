#!/usr/bin/perl

my $path = "input.txt";
open(my $FH, '<', $path);
my %counter;
my @col1 = 0;

while(<$FH>)
{
	chomp;
	my ($a, $b) = split /\s+/;
	push @col1, $a;
	$counter{$b}++;
}
close($FH);

my $size = scalar @col1;
my $sum = 0;
for my $i (0 .. $size)
{
	if(defined $counter{$col1[$i]})
	{
		$sum += $col1[$i] * $counter{$col1[$i]};
	}
} 

print ("$sum\n");
