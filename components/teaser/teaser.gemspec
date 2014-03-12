$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem"s version:
require "teaser/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "teaser"
  s.version     = Teaser::VERSION
  s.authors     = ["Stephan Hagemann"]
  s.email       = ["stephan.hagemann@gmail.com"]
  s.summary     = "Teaser gem"
  s.description = "Teaser gem"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "4.0.3"
  s.add_dependency "haml-rails", "0.5.3"
  s.add_dependency "sass-rails", "4.0.1"
  s.add_dependency "jquery-rails", "3.1.0"

  s.add_dependency "event_counter"
  s.add_dependency "annoyance"
  s.add_dependency "email_signup"

  s.add_development_dependency "rspec-rails", "2.14.1"
  s.add_development_dependency "capybara", "2.1.0"
  s.add_development_dependency "shoulda-matchers", "2.4.0"
  s.add_development_dependency "sqlite3", "1.3.9"
  s.add_development_dependency "poltergeist", "1.4.1"
  s.add_development_dependency "jasmine", "1.3.2"
end
