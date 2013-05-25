# fizzbuzz brute force / optimized for the mod operation
(1..100).each do |i|
    x=(i%3==0)
    y=(i%5==0)
    puts 'Fizz' if x && !y
    puts 'Buzz' if !x && y
    puts 'FizzBuzz' if x && y
    puts i unless x || y
end
