require "request_spec_helper"

feature "Signing up for tnbt updates", %q{
  In order to stay informed about the next big thing
  As a person
  I want to be able to sign up to updates
} do

  background do
    EmailSignup::Entry.delete_all
  end

  scenario "sign up", js: "true" do
    visit "/"

    expect {
      fill_in "signup", with: "stephan@pivotallabs.com"
      press_key_on_selector(13, "#signup")

      page.should have_content "Thanks for signing up!"
    }.to change(EmailSignup::Entry, :count).from(0).to(1)
  end
end