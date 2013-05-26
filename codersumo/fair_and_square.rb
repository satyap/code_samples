module CoderSumo
    def palindrome?
        self == self.to_s.reverse.to_i
    end
end
class Fixnum; include CoderSumo end
class Bignum; include CoderSumo end
n=1
i=0
while i<25
    if n.palindrome? and (n*n).palindrome? 
        puts n*n
        i += 1
    end
    n+=1
end

__END__
http://codersumo.com/challenges/9
Fair and Square

A palindrome is just an integer that reads the same backwards and forwards - so 6, 11 and 121 are all palindromes, while 10, 12, 223 and 2244 are not.

A fair and square number - it is a number that is a palindrome and the square of a palindrome at the same time. For instance, 1, 9 and 121 are fair and square (being palindromes and squares, respectively, of 1, 3 and 11), while 16, 22 and 676 are not fair and square: 16 is not a palindrome, 22 is not a square, and while 676 is a palindrome, it is the square of 26, which is not a palindrome.

Find the first 25 fair and square numbers. Print each number to the stdout. Separate each number with a end of line character.

Note: Challenge published in the Google CodeJam 2013 (and slightly modified)

