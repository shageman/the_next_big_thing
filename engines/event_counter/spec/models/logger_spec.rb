require "spec_helper"

module EventCounter
  describe EventCounter::Logger do
    describe "#log" do
      it "returns the new logged count" do
        subject.log("some_object", "some_event").should == 1
        subject.log("some_object", "some_event").should == 2
        subject.log("some_object", "some_event").should == 3

        subject.log("some_object", "some_other_event").should == 1
        subject.log("some_other_object", "some_event").should == 1
      end
    end
  end
end
