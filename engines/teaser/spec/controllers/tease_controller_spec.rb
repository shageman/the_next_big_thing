require "spec_helper"

module Teaser
  describe TeaseController do
    describe "GET new" do
      it "should not fail" do
        expect {
          get :new, use_route: "teaser"
        }.to_not raise_exception
      end
    end

    describe "POST create" do
      it "should fail if no new_sign_up_entry parameter is given" do
        xhr :post, :create, use_route: "teaser"
        response.status.should == 400
        response.body.should == "Hey! Please call this right... I need a new signUp entry!"

        xhr :post, :create, new_sign_up_entry: nil, use_route: "teaser"
        response.status.should == 400
        response.body.should == "Hey! Please call this right... I need a new signUp entry!"
      end

      it "should fail if the value given in the new_sign_up_entry parameter already exists in the database" do
        Teaser::Entry.create!(email: "adam")

        xhr :post, :create, new_sign_up_entry: "adam", use_route: "teaser"
        response.status.should == 400
        response.body.should == "Hm... something went wrong. Did you already sign up?"
      end

      it "should fail if the new entry cannot be saved" do
        Teaser::Entry.stub(:create).and_return(false)

        xhr :post, :create, new_sign_up_entry: "something unsaveable", use_route: "teaser"
        response.status.should == 500
        response.body.should == "Hm... something went seriously wrong."
      end

      it "should be a success if the new entry can be saved" do
        Teaser::Entry.stub(:create).and_return(true)

        xhr :post, :create, new_sign_up_entry: "something unsaveable", use_route: "teaser"
        response.status.should == 200
        response.body.should == "Thanks for signing up!"
      end
    end
  end
end