module CoderSumo
    def self.triangle(rows)
        out = [[1]]
        rows.times do |i|
            next if i==0
            out[i] = [1]
            out[i-1].each_with_index do |_, n|
                next if n==0
                out[i] << out[i-1][n-1] + out[i-1][n]
            end
            out[i] << 1
        end
        out
    end
end

if $0==__FILE__
    CoderSumo.triangle(15).each do |line|
puts line.join ' '
    end
end

__END__
Tartaglia's triangle (also known as Pascal's triangle) is a triangle of numbers
in which a row represents the coefficients of the binomial series. The triangle is
bordered by ones on the right and left sides, and each interior entry is
the sum of the two entries above (please refer to wikipedia for the mathematical definition).

    Example of a Tartaglia's triangle of 6 rows:

1
1 1
1 2 1
1 3 3 1
1 4 6 4 1
1 5 10 10 5 1

Write a function triangle(n) that generates a Tartaglia's triangle of n rows.

    Output
Display a triangle up to the 15th row. Each row must be aligned to the left, and separated by an end of line character.
