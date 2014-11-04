class PrimeTable
  def initialize(n = 10)
    @n = n
    @primes = []
    calc_primes
  end

  def get_table
    # Slightly better than previous, but not by much.
    out = [[nil] + @primes.dup]
    @primes.each_with_index do |p1, i|
      out[i+1] = [p1]
      @primes.each_with_index do |p2, j|
        break if i<j
        out[i+1][j+1] = out[j+1][i+1] = p1 * p2
      end
    end

    return out
  end

  private
  def is_prime?(i)
    # Assumption: all primes < i are in the @primes array
    # This is O(1) for prime and even numbers!
    # It is also O(1) for every 3rd and every 5th number.
    # Overall, it's O(sqrt(n)) or better since it only iterates over primes.

    @primes.include?(i) || @primes.all? {|p| i<p || i % p != 0}
  end

  def calc_primes
    i = 2
    while @primes.length < @n do
      @primes << i if is_prime?(i)
      i += 1
    end
  end
end


if __FILE__==$0
  primes = PrimeTable.new(10)
  primes.get_table.each do |row|
    puts row.join "\t"  # does not try to align columns
  end
end
