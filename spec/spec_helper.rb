require 'simplecov'
SimpleCov.start 'rails'

ENV["RAILS_ENV"] = 'test'

require File.expand_path('../dummy/config/environment.rb',  __FILE__)
require 'rspec/rails'
require 'shoulda-matchers'
require 'ffaker'
require 'database_cleaner'
require 'capybara'
require 'capybara/rspec'
require 'capybara/rails'
require 'capybara/poltergeist'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each {|f| require f }

require 'spree/testing_support/factories'
require 'spree/testing_support/controller_requests'
require 'spree/testing_support/authorization_helpers'
require 'spree/testing_support/url_helpers'

FactoryGirl.find_definitions

RSpec.configure do |config|
  config.deprecation_stream = 'rspec.log'
  config.include Spree::TestingSupport::ControllerRequests
  config.include FactoryGirl::Syntax::Methods
  config.include Spree::TestingSupport::UrlHelpers
  config.use_transactional_fixtures = false
  config.expose_current_running_example_as :example
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before do
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  Capybara.javascript_driver = :poltergeist
end
