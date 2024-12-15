#!/usr/bin/perl

my $path = "input.txt";
open(my $FH, '<', $path);
my @line;
my $safety = 0;
while (<$FH>) 
{
    chomp;
    my @line = split(/\s+/, $_);
    my $safe_aux = 0;

    foreach my $i (0 .. $#line) 
    {
        if ($safe_aux == 1) 
        {
            next;
        }

    my @index_list = 0 .. $#line;
    splice(@index_list, $i, 1);
    my @array_aux = @line[@index_list];

    if (is_ordered('<', @array_aux) || is_ordered('>', @array_aux)) 
    {
        my $aux = 1;
        for my $j (1 .. $#array_aux) 
        {
            my $diff = abs($array_aux[$j - 1] - $array_aux[$j]);
            if ($diff >= 4 || $diff == 0) 
            {
                $aux = 0;
            }
        }
            
        if ($aux) 
        {
            $safety++;
            $safe_aux = 1;
        }
    }
    }
}

sub is_ordered 
{
    my ($order, @array) = @_;
    for my $i (1 .. $#array) 
    {
        return 0 unless eval "$array[$i] $order $array[$i - 1]";
    }
    return 1
}

close($FH);

print("$safety\n");