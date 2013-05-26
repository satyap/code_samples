require './non_abundant_sums'

describe "Fixnum#abundant?" do
    it "should tell us if the number is less than sum of its proper divisors" do
        1.abundant?.should be_false
        2.abundant?.should be_false
        4.abundant?.should be_false
        5.abundant?.should be_false
        12.abundant?.should be_true
        24.abundant?.should be_true
    end
end
