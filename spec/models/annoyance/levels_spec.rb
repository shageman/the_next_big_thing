require "spec_helper"

describe Annoyance do
  describe ".levels" do
    it "should be an array of strings" do
      Annoyance.levels.should be_an Array
      Annoyance.levels.select { |level| level.is_a? String }.count.should == Annoyance.levels.count
    end
  end
end

