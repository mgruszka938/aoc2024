#!/usr/bin/perl

my $path = "input.txt";
open(my $FH, '<', $path);
my @line;
my $good = 0;
my $safety = 0;
while(<$FH>)
{
    chomp;
    my @line = split(/\s+/, $_);
    if (isOrder('<', @line) || isOrder('>', @line))
    {
        $good = 1;
        for my $i (1 .. $#line)
        {
            my $difference = abs($line[$i - 1] - $line[$i]);
            if ($difference >= 4 || $difference == 0)
            {
                $good = 0;
                last;
            }
        }
    }
    $safety++ if $good;
}    

sub isOrder 
{
    my ($order, @array) = @_; # (< || >, input)
    for my $i (1 .. $#array)
    {
        return 0 unless eval "$array[$i - 1] $order $array[$i]"; # array[i - 1] < || > array [i]
    }
    return 1;
}
close($FH);

print("$safety\n")