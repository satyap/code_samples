class PrimeTable
  def initialize(n = 10)
    @n = n
    @primes = []
    calc_primes
  end

  def get_table
    # TODO: optimize this. Right now it is O(n^2)
    out = [[nil] + @primes.dup]
    @primes.each_with_index do |p, i|
      out[i+1] ||= [p]
      @primes.each_with_index do |o, j|
        out[i+1][j+1] = @primes[i] * @primes[j]
      end
    end

    return out
  end

  private
  def is_prime?(i)
    # assumption: all primes < i are in the @primes array
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
