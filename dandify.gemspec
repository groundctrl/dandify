lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dandify/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = 'dandify'
  spec.version     = Dandify::VERSION
  spec.authors     = ['Vincent Franco', 'David Freerksen']
  spec.homepage    = 'http://github.com/groundctrl/dandify'
  spec.summary     = 'Add dynamic styling to your store.'
  spec.description = spec.summary
  spec.license     = 'MIT'
  spec.required_ruby_version = '>= 1.9.3'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  spec.test_files   = `git ls-files -- spec/*`.split("\n")
  spec.require_path = 'lib'
  spec.has_rdoc = false
  spec.requirements << 'none'

  spec.add_dependency 'spree_core', '~> 2.3.0.beta'
  spec.add_dependency 'sass', '~> 3.3.8'
  spec.add_development_dependency 'sqlite3', '~> 1.3'
  spec.add_development_dependency 'rspec-rails', '~> 2.14'
  spec.add_development_dependency 'capybara', '~> 2.2'
  spec.add_development_dependency 'database_cleaner', '1.2'
  spec.add_development_dependency 'poltergeist', '1.5'
  spec.add_development_dependency 'factory_girl', '~> 4.4'
  spec.add_development_dependency 'simplecov', '~> 0.7'
  spec.add_development_dependency 'pry', '~> 0.9'
  spec.add_development_dependency 'debugger', '~> 1.6'
  spec.add_development_dependency 'shoulda-matchers', '~> 2.5'
end
