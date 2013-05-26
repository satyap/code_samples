require './amicable'

describe "Fixnum#divisors" do
    it "should return the proper divisors of a number" do
        0.divisors.sort.should == []
        1.divisors.sort.should == []
        2.divisors.sort.should == [1]
        3.divisors.sort.should == [1]
        4.divisors.sort.should == [1,2]
        5.divisors.sort.should == [1]
        6.divisors.sort.should == [1,2,3]
        8.divisors.sort.should == [1,2,4]
        18.divisors.sort.should == [1,2,3,6,9]
        25.divisors.sort.should == [1,5]
        220.divisors.sort.should == [1, 2, 4, 5, 10, 11, 20, 22, 44, 55, 110]
        284.divisors.sort.should == [1, 2, 4, 71, 142]
    end
end

describe "Fixnum#d" do
    it "should return the sum of the divisors of a number" do
        0.d.should == 0
        1.d.should == 0
        2.d.should == 1
        3.d.should == 1
        4.d.should == 3
        5.d.should == 1
        6.d.should == 6
        8.d.should == 7
        18.d.should == 1+2+3+6+9
        25.d.should == 6
        220.d.should == 284
        284.d.should == 220
    end
end

describe "Fixnum.amicable?" do
    it "should tell us if a number is amicable with another" do
        220.amicable?(284).should be_true
        284.amicable?(220).should be_true
        285.amicable?(220).should be_false
        284.amicable?(120).should be_false
    end
end
