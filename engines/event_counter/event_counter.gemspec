$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "event_counter/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "event_counter"
  s.version     = EventCounter::VERSION
  s.authors     = ["Stephan Hagemann"]
  s.email       = ["stephan@pivotallabs.com"]
  s.homepage    = "https://github.com/shageman/event_counter"
  s.summary     = "Rails engine to count the occurences of events on objects."
  s.description = "This engine is part of a rails-architcture-sample app, which you can find at https://github.com/shageman/the_next_big_thing"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "3.2.13"

  s.add_development_dependency "rspec-rails", "2.12.2"
  s.add_development_dependency "shoulda-matchers", "1.4.2"
  s.add_development_dependency "sqlite3", "1.3.7"
end
