require './sieve'
describe "Sieve.apply_to" do
    it "should return a list of primes using the sieve of erastothenes" do
        Sieve.apply_to(2).should == []
        Sieve.apply_to(3).should == [2]
        Sieve.apply_to(4).should == [2, 3]
        Sieve.apply_to(5).should == [2, 3]
        Sieve.apply_to(6).should == [2, 3, 5]
        Sieve.apply_to(7).should == [2, 3, 5]
        Sieve.apply_to(8).should == [2, 3, 5, 7]
        Sieve.apply_to(9).should == [2, 3, 5, 7]
        Sieve.apply_to(10).should == [2, 3, 5, 7]
        Sieve.apply_to(11).should == [2, 3, 5, 7]
        Sieve.apply_to(12).should == [2, 3, 5, 7, 11]
        Sieve.apply_to(13).should == [2, 3, 5, 7, 11]
        Sieve.apply_to(14).should == [2, 3, 5, 7, 11, 13]
        Sieve.apply_to(15).should == [2, 3, 5, 7, 11, 13]
        Sieve.apply_to(150).should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149]
    end
end
