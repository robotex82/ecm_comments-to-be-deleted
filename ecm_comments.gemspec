$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/comments/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_comments"
  s.version     = Ecm::Comments::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_comments"
  s.summary     = "News module for active admin."
  s.description = "News module for active admin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  
  s.add_dependency "rails", "~> 3.0.11"
  s.add_development_dependency "sqlite3"
  
  # Testing
  s.add_development_dependency "capybara", ">= 0.4.0"
end
