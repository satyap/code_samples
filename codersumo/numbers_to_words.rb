# numbers to words -- incomplete
# You can code in Ruby

n2w = [""] + %w[
        one two three four five six seven eight nine
]
pos=["", ""] + %w[thousand] + ['','']

while line = gets
    puts line
    line.chomp!
    digits = line.split('').reverse
    i=0
    puts digits.map do |d|
        puts i
        i+=1
        [pos[i], n2w[d.to_i]]
    end.flatten.reverse.join('-')
end

