module CoderSumo
    def self.heavy?(num)
        sum = num.split("").inject(0) {|memo, i| memo + i.to_i}
        sum.to_f/num.length > 7
    end
end

if $0==__FILE__
    while line = gets
        print line if CoderSumo.heavy?(line.chomp)
    end
end

__END__

http://codersumo.com/challenges/8

Heavy Integers

A non-negative integer is called heavy if the average value of its digits in decimal representation is greater than 7.

    For example the number 779 is heavy because (7+7+9)/3 = 7.66, instead 780 is not heavy because (7+8+0)/3 = 5.

    Write a function that is able to recognize if a number is heavy or not. Note, there's a trivial solution, and a smart one...

    Input
Read from stdin a sequence of non-negative integers.

    Output
If the number is heavy, print it to the stdout. Separate each line by a return character.

