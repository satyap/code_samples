require './collatz'
describe "Fixnum#collatz" do
    it "should return the Collatz sequence for the number" do
        13.collatz.should == [ 13 , 40 , 20 , 10 , 5 , 16 , 8 , 4 , 2 , 1 ]
        40.collatz.should == [ 40 , 20 , 10 , 5 , 16 , 8 , 4 , 2 , 1 ]
        1.collatz.should == [ 1 ]
        2.collatz.should == [ 2, 1 ]
        3.collatz.should == [ 3, 10, 5, 16, 8, 4, 2, 1 ]
    end
end
