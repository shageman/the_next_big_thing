$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem"s version:
require "teaser/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "teaser"
  s.version     = Teaser::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Teaser."
  s.description = "TODO: Description of Teaser."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "3.2.13"
  s.add_dependency "haml-rails", "0.3.5"
  s.add_dependency "sass-rails", "3.2.6"
  s.add_dependency "jquery-rails", "2.2.1"

  s.add_dependency "annoyance"
  s.add_dependency "email_signup"

  s.add_development_dependency "rspec-rails", "2.12.2"
  s.add_development_dependency "capybara", "1.1.4"
  s.add_development_dependency "shoulda-matchers", "1.4.2"
  s.add_development_dependency "sqlite3", "1.3.7"
  s.add_development_dependency "poltergeist", "1.0.2"
  s.add_development_dependency "jasmine", "1.3.1"
end
