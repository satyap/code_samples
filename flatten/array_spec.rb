# Test the recursive version, Array#flatten2
require './array'
describe Array do 
    describe "#flatten2" do
        it "returns empty for empty arrays" do
            array = [] 
            array.flatten2.should == []
        end
        it "returns array for already-flat arrays" do
            array = [1,2,3]
            array.flatten2.should == [1,2,3]
        end
        it "flattens single-depth arrays" do
            array = [1,2,[3,4,6,5]] 
            array.flatten2.should == array.flatten
            array.should == [1,2,[3,4,6,5]] # to prove that the original isn't changed
        end
        it "flattens multi-depth arrays" do
            array = [1,2, [3, [4,5]], 6]
            array.flatten2.should == array.flatten
            array.should == [1,2, [3, [4,5]], 6] # to prove that the original hasn't changed
        end
        it "flattens sub-classed arrays" do
            class NewArray < Array
            end
            na = NewArray.new([2, 3, [4,5]])
            array = [1, na, 6]
            array.flatten2.should == [1,2,3,4,5,6]
        end
    end
    describe "#flatten2!" do
        it "flattens in-place" do
            array = [1,2,[3,4]]
            orig = array.clone
            array.flatten2!
            array.should == orig.flatten
        end
    end
end
