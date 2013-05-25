# This turns out to be O(n) :(
class String
    def jolly_jumper?
        nums = self.split(' ')
        has_it = nums.map{false}
        has_it.pop
        nums.each_with_index do |n, i|
            next if i==0
            diff = (n.to_i - nums[i-1].to_i).abs
            next if diff==0
            has_it[diff - 1]=true
        end
        has_it.all? {|x| x}
    end
end

if $0==__FILE__
    while line=gets
        puts line.chomp.jolly_jumper? ? ':)' : ':('
    end
end


__END__
http://codersumo.com/challenges/2
A sequence of n > 0 integers is called a jolly jumper if the absolute values of the differences between successive elements take on all possible values 1 through n-1.

    For example: 1 4 2 3 is a jolly jumper, because the absolutes differences are 3, 2 , and 1 respectively. The definition implies that any sequence of a single integer is a jolly jumper.

    Write a program to determine whether a sequence of numbers is a jolly jumper:

    Input
List of sequences (read from stdin)

Output
For each sequence, print ":)" if the sequence is a jolly jumper, otherwise print ":("
