class Fixnum
    def collatz
        return @collatz if @collatz
        sub_collatz = self==1 ? [] : (self.even? ? self/2 : 3*self+1).collatz
        @collatz = [self] + sub_collatz
    end
end

module CoderSumo
    def self.collatz(max=10000)
        max_num = 0
        max_length = 0
        (1..max).each do |i|
            if max_length < (len=i.collatz.length)
                max_num = i 
                max_length = len
            end
        end
        max_num
    end
end

if $0 == __FILE__
    puts CoderSumo.collatz
end


__END__
http://codersumo.com/challenges/12
Longest Collatz Sequence

This challenge appears in Project Euler. Read the full description here: http://projecteuler.net/problem=14

Output
Which starting number, under 10000, produces the longest chain? Print the result to stdout.


    http://projecteuler.net/problem=14



The following iterative sequence is defined for the set of positive integers:

    n -> n/2 (n is even)
n -> 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:
    13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1

It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

    Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.

