# fizzbuzz optimised for the puts
(1..100).each do |i|
    out = ''
    out = 'Fizz' if i%3==0
    out << 'Buzz' if i%5==0
    puts out=='' ? i : out
end
