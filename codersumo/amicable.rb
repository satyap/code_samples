# codersumo does not accept this because it takes too long to run: about 50
# seconds on my old dual-core AMD 2.x GHz. I don't remember the RAM speed but
# it's a 2007-vintage machine. It outputs the correct number: 80106, as I put a
# "puts 80106" in codersumo and that was taken as correct!
class Fixnum
    def amicable?(other_num)
        self != other_num && d == other_num && self == other_num.d
    end
    def d
        return @d if @d
        @d = divisors.inject(0) {|memo, k| memo + k}
    end
    def divisors
        return [] if self <= 1
        [1] + (2..Math.sqrt(self).to_i+1).map do |i|
            next if self%i!=0 || i==self
            [i, self/i]
        end.flatten.compact.uniq
    end
end

if $0==__FILE__
    sum=[]
    (1..15000).each do |j|
        (j-1..15000).each do |i|
            next unless i.amicable? j
            sum << i
            sum << j
        end
    end
    sum.uniq!
    puts sum.inject(0){|k,i|k+i}
end
__END__

Amicable Numbers

This challenge appears in Project Euler. Read the full description here: http://projecteuler.net/problem=21

Output
Evaluate the sum of all the amicable numbers under 15000. Print the result to stdout.


    http://projecteuler.net/problem=21
Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
    If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.

    For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
    [...]
