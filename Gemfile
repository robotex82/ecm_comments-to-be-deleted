source "https://rubygems.org"

# Declare your gem's dependencies in ecm_news.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# jquery-rails is used by the dummy application
gem "jquery-rails"

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'ruby-debug'

# Edge active admin
gem 'activeadmin', :git => 'git://github.com/gregbell/active_admin.git'

# Patched guard rails
gem 'guard-rails',  :git => 'git://github.com/robotex82/guard-rails.git', :branch => 'better-engine-support'

unless ENV['TRAVIS_RUBY_VERSION'].nil?
  gem 'pg'
  gem 'mysql2'
end

