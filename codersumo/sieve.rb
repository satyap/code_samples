# I got the algorithm for the Sieve from wikipedia.
class Sieve
    def self.apply_to(max)
        return [] unless max > 2
        primes = Array.new(max, true)
        primes[0]=false
        primes[1]=false
        n=2
        while n*n<=max
            if primes[n]
                (n..max/n).each{|p| primes[p*n] = false}
            end
            n+=1
        end
        i=0
        primes.map{|p| i+=1; i-1 if p}.compact
    end
end

if $0 == __FILE__
    primes = Sieve.apply_to(97531)
    puts primes.length
end

__END__

http://codersumo.com/challenges/14
Classic: Sieve of Eratosthenes
Write a function that takes a single argument n and returns a list of prime numbers less than or equal to n using the Sieve of Eratosthenes. Calculate the number of primes < 97531. Print the result to stdout.
