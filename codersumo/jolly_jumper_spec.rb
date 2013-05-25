require './jolly_jumper'

describe "String#jolly_jumper?" do
    it "should return true for jolly jumpers and false for not" do
        '1 4 2 3'.jolly_jumper?.should be_true
        '1 4 2 -1 6'.jolly_jumper?.should be_false
        '789 788 787'.jolly_jumper?.should be_false
        '1 2'.jolly_jumper?.should be_true
        '33 33 33 33'.jolly_jumper?.should be_false
        '12 13 15 18'.jolly_jumper?.should be_true
    end
end
