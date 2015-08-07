$:.push File.expand_path("../lib", __FILE__)

require "stopover/version"

Gem::Specification.new do |s|
  s.name        = "stopover"
  s.version     = Stopover::VERSION
  s.authors     = ["rono23"]
  s.email       = ["rono23@gmail.com"]
  s.homepage    = "https://github.com/rono23/stopover"
  s.summary     = "Generate static pages with the asset pipeline on Rails."
  s.description = "Generate static pages with the asset pipeline on Rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.required_ruby_version = '~> 2.0'

  s.add_dependency "rails", "~> 4.1"

  s.add_development_dependency "sqlite3"
end
