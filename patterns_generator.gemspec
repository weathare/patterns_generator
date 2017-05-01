$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "patterns_generator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "patterns_generator"
  s.version     = PatternsGenerator::VERSION
  s.authors     = ["weathare"]
  s.email       = ["fuzuki.close@gmail.com"]
  s.homepage    = "https://github.com/weathare/patterns_generator"
  s.summary     = "Create class files in app/parameters for Ruby on Rails as a generator."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency "rails", "~> 5.0.2"
  s.add_development_dependency "ammeter"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency "rspec-rails"
end
