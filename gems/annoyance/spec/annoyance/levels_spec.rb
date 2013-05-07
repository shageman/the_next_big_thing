require File.expand_path("../../../app/models/annoyance/levels", __FILE__)

module Annoyance
  describe Annoyance do
    describe ".levels" do
      it "should be an array of strings" do
        Annoyance::Levels.levels.should be_an Array
        Annoyance::Levels.levels.select {|level| level.is_a? String }.count.should == Annoyance::Levels.levels.count
      end
    end
  end
end

