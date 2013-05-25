require './rle_encoding'
describe "String#rle" do
    it "should return the rle-encoded string" do
        'Sweettoothed'.rle.should == '1S1w2e2t2o1t1h1e1d'
        'Bookkeeper'.rle.should == '1B2o2k2e1p1e1r'
        'Heeeeeeellllllooooo'.rle.should == '1H7e6l5o'
        '111112222333445'.rle.should == '5142332415'
    end
end
