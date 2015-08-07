lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dandify/version'

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = 'dandify'
  spec.version     = Dandify::VERSION
  spec.authors     = ['Vincent Franco', 'David Freerksen']
  spec.homepage    = 'http://github.com/groundctrl/dandify'
  spec.summary     = 'Add dynamic styling to your store.'
  spec.description = spec.summary
  spec.license     = 'MIT'
  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir['{app,config,db,lib}/**/*',
                   'MIT-LICENSE',
                   'Rakefile',
                   'README.md']
  spec.test_files   = `git ls-files -- spec/*`.split("\n")
  spec.require_path = 'lib'
  spec.has_rdoc     = false
  spec.requirements << 'none'

  spec.add_dependency 'spree_core', '~> 3.0'
  spec.add_dependency 'paper_trail', '~> 4.0'

  spec.add_development_dependency 'sass-rails'
  spec.add_development_dependency 'coffee-rails'

  spec.add_development_dependency 'sqlite3', '~> 1.3'
  spec.add_development_dependency 'rspec-rails', '~> 3.3'
  spec.add_development_dependency 'capybara', '~> 2.4'
  spec.add_development_dependency 'database_cleaner', '1.4'
  spec.add_development_dependency 'poltergeist', '1.6'
  spec.add_development_dependency 'factory_girl', '~> 4.5'
  spec.add_development_dependency 'simplecov', '~> 0.10'
  spec.add_development_dependency 'pry-byebug', '~> 3.2'
  spec.add_development_dependency 'shoulda-matchers', '~> 2.8'
end
