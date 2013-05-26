class Fixnum
    def divisors
        return [] if self <= 1
        [1] + (2..Math.sqrt(self).to_i+1).map do |i|
            next if self%i!=0 || i==self
            [i, self/i]
        end.flatten.compact.uniq
    end
end
