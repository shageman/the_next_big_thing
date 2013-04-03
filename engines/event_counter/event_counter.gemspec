$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "event_counter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "event_counter"
  s.version     = EventCounter::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of EventCounter."
  s.description = "TODO: Description of EventCounter."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "3.2.13"

  s.add_development_dependency "rspec-rails", "2.12.2"
  s.add_development_dependency "shoulda-matchers", "1.4.2"
  s.add_development_dependency "sqlite3", "1.3.7"
end
