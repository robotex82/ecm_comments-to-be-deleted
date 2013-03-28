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
  s.summary     = "Comments module for active admin."
  s.description = "Comments module for active admin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  # Module dependencies
  s.add_dependency "rails", "~> 3.2.13"

  # Dummy app
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency "sqlite3"

  # Development Server
  s.add_development_dependency "thin"

  # Documentation
  s.add_development_dependency "yard"

  # Tests
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'rspec-rails', '~> 2.0'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails', '~> 1.0'

  # Test automation
  s.add_development_dependency 'rb-inotify', '~> 0.9'
  # s.add_development_dependency 'guard-rails' # See gemfile for a patched version, for engine support.
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'guard-bundler'
end

