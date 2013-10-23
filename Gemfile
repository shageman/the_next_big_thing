source "https://rubygems.org"

gem "rails", "3.2.13"

gem "email_signup", path: "engines/email_signup"
gem "teaser", path: "engines/teaser"
gem "annoyance", path: "gems/annoyance"

group :test, :development do
  gem "rspec-rails", "2.14.0"
  gem "capybara", "2.1.0"
  gem "sqlite3", "1.3.7"
end

group :production do
  gem "pg"
end