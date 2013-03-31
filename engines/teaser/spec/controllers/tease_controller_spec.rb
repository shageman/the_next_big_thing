require "spec_helper"

module Teaser
  describe TeaseController do
    before do
      controller.stub(:inject_dependencies)
    end

    describe "GET new" do
      it "should not fail" do
        expect {
          get :new, use_route: "teaser"
        }.to_not raise_exception
      end
    end

    describe "POST create" do
      it "should use the annoyance meter set to 20" do
        controller.unstub!(:inject_dependencies)
        Annoyance::Meter.should_receive(:new).with(20)
        xhr :post, :create, use_route: "teaser"
      end

      it "should fail if no new_sign_up_entry parameter is given" do
        xhr :post, :create, use_route: "teaser"
        response.status.should == 400
        response.body.should == "Hey! Please call this right... I need a new signUp entry!"

        xhr :post, :create, new_sign_up_entry: nil, use_route: "teaser"
        response.status.should == 400
        response.body.should == "Hey! Please call this right... I need a new signUp entry!"
      end

      it "should fail if the given new_sign_up_entry already exists (and use the annoyance meter)" do
        mock_annoyance_meter = mock("annoyance_meter", annoyance_adjusted: "Oh I am annoyed...")
        controller.instance_variable_set "@annoyance_meter", mock_annoyance_meter

        entry = NewsSignup::Entry.create!(email: "adam", tries: 0)

        xhr :post, :create, new_sign_up_entry: "adam", use_route: "teaser"
        response.status.should == 400
        response.body.should == "Oh I am annoyed..."
        entry.reload.tries.should == 1
      end

      it "should fail if the new entry cannot be saved" do
        NewsSignup::Entry.stub(:create).and_return(false)

        xhr :post, :create, new_sign_up_entry: "something unsaveable", use_route: "teaser"
        response.status.should == 500
        response.body.should == "Hm... something went seriously wrong."
      end

      it "should be a success if the new entry can be saved" do
        NewsSignup::Entry.stub(:create).and_return(true)

        xhr :post, :create, new_sign_up_entry: "something unsaveable", use_route: "teaser"
        response.status.should == 200
        response.body.should == "Thanks for signing up!"
      end
    end
  end
end