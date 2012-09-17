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

  s.add_dependency "rails", "~> 3.2.8"

  s.add_dependency "haml-rails"
  s.add_dependency "sass-rails"

  s.add_dependency "jquery-rails"

  s.add_dependency "annoyance"
end
