require "spec_helper"

feature "The Next Big Thing Homepage", %q{
  In order to get informed about the next big thing
  As a person
  I want to be able to read about nothing definite about it and sign up for more info
} do

  scenario "The Homepage" do
    visit "/"
    page.should have_content("The Next Big Thing")
    page.should have_content("Find nothing out about it right here!")
  end
end