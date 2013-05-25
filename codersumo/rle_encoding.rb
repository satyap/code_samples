# RLE Encoding
# http://codersumo.com/challenges/5
# For example: If we apply the RLE to the string 'Heeellooworld!!', the encoded result is:
#
#     1H3e2l2o1w1o1r1l1d2!
#
# Write a RLE compression algorithm.

class String
    def rle
        prev=nil
        count=0
        accum=''
        self.split("").each do |c|
            prev ||= c
            if prev!=c
                accum << "#{count}#{prev}"
                prev=c
                count=0
            end
            count+=1
        end
        if count > 0
            accum << "#{count}#{prev}"
        end
        accum
    end
end

if $0==__FILE__
    while line=gets
        puts line.chomp.rle
    end
end
