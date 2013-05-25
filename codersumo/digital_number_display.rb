# Digital Number Display
# Write a program that displays each number as they would look in a led digital clock:
# http://codersumo.com/challenges/3
#
# echo 38579 | ruby digital_number_display.rb

class String
    def to_7seg
        segs = [
            [],
            [],
            [],
            [],
            [],
        ]
        self.to_s.chomp.split('').each do |digit|
            (0..4).each do |line|
                segs[line] << DIGITS[digit.to_i][line]
            end
        end
        segs.each do |line|
            puts line.join(" ")
        end
    end

    DIGITS = [
        [
            "####",
            "#  #",
            "#  #",
            "#  #",
            "####"
    ],
        [
            "   #",
            "   #",
            "   #",
            "   #",
            "   #"
    ],
        [
            "####",
            "   #",
            "####",
            "#   ",
            "####"
    ],
        [
            "####",
            "   #",
            "####",
            "   #",
            "####"
    ],
        [
            "#  #",
            "#  #",
            "####",
            "   #",
            "   #"
    ],
        [
            "####",
            "#   ",
            "####",
            "   #",
            "####"
    ],
        [
            "#   ",
            "#   ",
            "####",
            "#  #",
            "####"
    ],
        [
            "####",
            "   #",
            "   #",
            "   #",
            "   #"
    ],
        [
            "####",
            "#  #",
            "####",
            "#  #",
            "####"
    ],
        [
            "####",
            "#  #",
            "####",
            "   #",
            "   #"
    ],
    ]
end

gets.to_7seg
