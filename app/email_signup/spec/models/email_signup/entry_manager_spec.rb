require "spec_helper"

module EmailSignup
  describe EmailSignup::EntryManager do
    before do
      Entry.delete_all
    end
    
    describe "#create" do
      it "creates an entry" do
        expect {
          subject.create "some_email@example.com"
        }.to change(Entry, :count).from(0).to(1)
      end

      it "does not create an entry with the same email address twice" do
        subject.create "some_email@example.com"
        expect {
          subject.create("some_email@example.com").should == nil
        }.to_not change(Entry, :count)
      end
    end

    describe "#find_by_email" do
      before do
        @entry = Entry.create! email: "some_email@example.com"
      end

      it "returns an entry iff the correct email is used" do
        subject.find_by_email("some_email@example.com").should == @entry
        subject.find_by_email("some_other_email@example.com").should == nil
      end
    end
  end
end