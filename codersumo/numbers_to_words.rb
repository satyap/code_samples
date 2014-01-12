class Fixnum
    def to_word
        return "zero" if self.zero?
        n2w = [nil] + %w[one two three four five six seven eight nine]
        tens2w = [nil] + %w[ten twenty thirty forty fifty sixty seventy eighty ninety]
        teens2w = %w[ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen]
        pos = [nil, nil] + %w[hundred] + %w[thousand] + [nil,nil] + %w[million]
        if self < 10
            return n2w[self]
        end
        if self < 20
            return teens2w[self - 10]
        end
        words = []
        digits = self.to_s.split('').reverse
        if digits[1]
            tens = n2w[digits[1].to_i]
            if tens=='one'
                words << teens2w[digits[0].to_i]
            else
                words << n2w[digits[0].to_i]
                words << tens2w[digits[1].to_i]
            end
        else
            words << n2w[digits[0].to_i]
        end
        if self >= 100
            digits[2..-1].each_with_index do |n, i|
                next if n=='0'
                words += [ pos[i+2], n.to_i.to_word ]
            end
        end

        return words.compact.reverse.join('-')
    end
end

if $0 == __FILE__
    while(x=gets)
        break unless /\A\d+\n\z/===x
        puts x.to_i.to_word 
    end
end

__END__
http://codersumo.com/challenges/4

Numbers to words

Write a function that converts numbers to words. Separate each word by a dash character.

    Example: The number 125 will be converted in:

    one-hundred-twenty-five

Input
List of numbers. Read from the stdin.

    Output
For each number, print out the english words

