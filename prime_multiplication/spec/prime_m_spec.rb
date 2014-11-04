require './prime_m'

describe PrimeTable do
  before do
    class PrimeTable
      attr_accessor :primes
      public :is_prime?
      public :calc_primes
    end
  end

  describe '#is_prime?' do
    describe 'when given a prime number' do
      it 'should return true' do
        p = PrimeTable.new
        p.primes = [2,3,4,7,11,13,17]
        expect(p.is_prime?(11)).to be true
        expect(p.is_prime?(13)).to be true
        expect(p.is_prime?(17)).to be true
        expect(p.is_prime?(31)).to be true
      end
    end

    describe 'when given a composite number' do
      it 'should return false' do
        p = PrimeTable.new
        p.primes = [2,3,5,7,11,13,17]
        expect(p.is_prime?(4)).to be false
        expect(p.is_prime?(6)).to be false
        expect(p.is_prime?(8)).to be false
        expect(p.is_prime?(9)).to be false
        expect(p.is_prime?(15)).to be false
        expect(p.is_prime?(15000)).to be false
      end
    end
  end

  describe '#primes' do
    it 'should return a list of N primes' do
      n=5
      p = PrimeTable.new(n)
      p.calc_primes
      expect( p.primes ).to eql([ 2, 3, 5, 7, 11 ])
    end
    describe 'when not given how many primes' do
      it 'should return 10 primes' do
        p = PrimeTable.new
        p.calc_primes
        expect( p.primes ).to eql([ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 ])
      end
    end
  end

end
