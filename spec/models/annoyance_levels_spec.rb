require "spec_helper"

describe AnnoyanceLevels do
  describe ".levels" do
    it "should be an array of strings" do
      AnnoyanceLevels.levels.should be_an Array
      AnnoyanceLevels.levels.select { |level| level.is_a? String }.count.should == AnnoyanceLevels.levels.count
    end
  end
end

