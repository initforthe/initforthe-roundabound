$:.push File.expand_path("../lib", __FILE__)

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "initforthe-roundabound"
  s.version     = 0.2
  s.authors     = ["Tom Simnett", "Rob Holland"]
  s.email       = ["tom@initforthe.com", "rob@initforthe.com"]
  s.homepage    = "http://github.com/initforthe/initforthe-roundabound"
  s.summary     = "CoffeeScript helpers for using the Bootstrap Carousel."
  s.description = "CoffeeScript helpers for using the Bootstrap Carousel."

  s.files = Dir["app/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", ">= 3.1.0"
end
