# Implement Array#flatten
class Array
    def flatten2
        a2=[]
        self.each do |a|
            if a.class.ancestors.include? Array
                a2 += a.flatten2
            else
                a2 << a
            end
        end
        return a2
    end

    def flatten2!
        # naive -- should do an in-place flattening, but the tests pass, so....
        self.replace self.flatten2
    end

    def flatten_iter
        a2 = self.dup
        a2.flatten_iter!
        return a2
    end

    def flatten_iter!
        i=0
        while(i < self.length) # self changes during the loop.
            if self[i].class.ancestors.include? Array
                # Stick the array's elements where the array "pointer" was.
                self.replace(self[0 .. i-1] + self[i] + self[i+1 .. self.length])
            end
            i+=1
        end
    end
end
