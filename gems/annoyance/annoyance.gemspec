$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "annoyance/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "annoyance"
  s.version     = Annoyance::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Annoyance."
  s.description = "TODO: Description of Annoyance."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]
end
