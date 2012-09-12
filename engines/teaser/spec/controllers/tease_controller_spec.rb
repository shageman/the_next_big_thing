require "spec_helper"

module Teaser
  describe TeaseController do
    describe "GET index" do
      it "should not fail" do
        expect {
          get :index, use_route: "teaser"
        }.to_not raise_exception
      end
    end
  end
end