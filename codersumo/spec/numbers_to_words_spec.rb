require './numbers_to_words'

describe "Fixnum#to_word" do
    it "should spell out the word in numbers" do
        0.to_word.should == "zero"
        1.to_word.should == "one"
        10.to_word.should == "ten"
        11.to_word.should == "eleven"
        12.to_word.should == "twelve"
        13.to_word.should == "thirteen"
        14.to_word.should == "fourteen"
        15.to_word.should == "fifteen"
        16.to_word.should == "sixteen"
        17.to_word.should == "seventeen"
        18.to_word.should == "eighteen"
        19.to_word.should == "nineteen"
        20.to_word.should == "twenty"
        21.to_word.should == "twenty-one"
        32.to_word.should == "thirty-two"
        43.to_word.should == "forty-three"
        54.to_word.should == "fifty-four"
        65.to_word.should == "sixty-five"
        76.to_word.should == "seventy-six"
        87.to_word.should == "eighty-seven"
        98.to_word.should == "ninety-eight"
        99.to_word.should == "ninety-nine"
        100.to_word.should == "one-hundred"
        104.to_word.should == "one-hundred-four"
        114.to_word.should == "one-hundred-fourteen"
        1354.to_word.should == "one-thousand-three-hundred-fifty-four"
        1099.to_word.should == "one-thousand-ninety-nine"
    end
end
