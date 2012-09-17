source "https://rubygems.org"

gem "rails"

gem "teaser", path: "engines/teaser"


group :test, :development do
  gem "rspec-rails"
  gem "capybara"
  gem "sqlite3"

  #Development requirements of teaser engine (for travis-ci)
  gem "shoulda-matchers"
  gem "poltergeist"
  gem "jasmine"
end
