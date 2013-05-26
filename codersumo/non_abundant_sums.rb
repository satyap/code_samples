require './divisors'
LARGEST_NON_ABUNDANT_SUM=28123
ABUNDANTS={}
ABS=[]
class Fixnum
    def sum_of_abundants?
        if self.abundant?
            ABUNDANTS[self]=true 
            ABS << self
        end
        ABS.each do |n|
            return true if ABUNDANTS[self-n]
        end
        false
    end
    def abundant?
        return @abundant if @abundant
        @abundant = self.divisors.inject(0){|i,k|i+k} > self
    end
end

module CoderSumo
    def self.non_abundant_sum
        (1..LARGEST_NON_ABUNDANT_SUM).inject(0) {|memo,i| i.sum_of_abundants? ? memo : memo+i}
    end
end

if $0 == __FILE__
    puts CoderSumo.non_abundant_sum
end

__END__
http://codersumo.com/challenges/13
Non-abundant sums

This challenge appears in Project Euler. Read the full description here: http://projecteuler.net/problem=23

Output
Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.


    http://projecteuler.net/problem=23
Non-abundant sums
Problem 23

A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

    A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

    As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

    Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

