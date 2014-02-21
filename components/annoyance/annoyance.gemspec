$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "annoyance/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "annoyance"
  s.version     = Annoyance::VERSION
  s.authors     = ["Stephan Hagemann"]
  s.email       = ["stephan.hagemann@gmail.com"]
  s.summary     = "A very annoyed gem"
  s.description = "A very annoyed gem"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rspec", "2.12.0"
end
