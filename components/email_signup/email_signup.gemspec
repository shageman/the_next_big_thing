$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "email_signup/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "email_signup"
  s.version     = EmailSignup::VERSION
  s.authors     = ["Stephan Hagemann"]
  s.email       = ["stephan.hagemann@gmail.com"]
  s.summary     = "The engine that is doing signup"
  s.description = "The engine that is doing signup"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "4.1.5"

  s.add_development_dependency "rspec-rails", "2.14.1"
  s.add_development_dependency "shoulda-matchers", "2.7.0"
  s.add_development_dependency "sqlite3", "1.3.9"
end
