class PrimeTable
  def initialize
    @primes = []
    primes
  end

  def get_table

  end

  private
  def is_prime?(i)
    # assumption: all primes < i are in the @primes array

  end

  def primes
    i = 2
    while primes.length < @n do
      @primes << is_prime? i
      i += 1
    end
  end
end


if __FILE__==$0
  primes = PrimeTable.new(10)
  primes.get_table do |row|
    puts row.join "\t"
  end
end
