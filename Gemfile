source "https://rubygems.org"

gem "rails", "3.2.13"
gem "haml-rails", "0.3.5"
gem "sass-rails", "3.2.6"
gem "jquery-rails", "2.2.1"

group :test, :development do
  gem "rspec-rails", "2.12.2"
  gem "capybara", "1.1.4"
  gem "sqlite3", "1.3.7"

  #Development requirements of teaser engine (for travis-ci)
  gem "shoulda-matchers", "1.4.2"
  gem "poltergeist", "1.0.2"
  gem "jasmine", "1.3.1"
end

group :production do
  gem "pg"
end