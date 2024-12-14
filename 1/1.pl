#!/usr/bin/perl

my $path = "input.txt";
open(my $FH, '<', $path);
my @col1 = 0;
my @col2 = 0;

while(<$FH>)
{
	chomp;
	my ($a, $b) = split /\s+/;
	push @col1, $a;
	push @col2, $b;
}
close($FH);

my @sortLeft = sort { $a <=> $b } @col1;
my @sortRight = sort { $a <=> $b } @col2;

my $size = scalar @sortLeft;
my $sum = 0;
for my $i (0 .. $size)
{
	$sum += abs(@sortLeft[$i] - abs $sortRight[$i]);
} 

print ("$sum\n");
