source "https://rubygems.org"

gem "rails"

gem "teaser", path: "engines/teaser"
gem "annoyance", path: "gems/annoyance"

group :test, :development do
  gem "rspec-rails"
  gem "capybara"
  gem "sqlite3"

  #Development requirements of teaser engine (for travis-ci)
  gem "shoulda-matchers"
  gem "poltergeist"
  gem "jasmine"
end

group :production do
  gem "pg"
end