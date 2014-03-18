# This file is copied to spec/ when you run 'rails generate rspec:install'
#ENV["RAILS_ENV"] ||= 'test'
#require File.expand_path("../../config/environment", __FILE__)
#require 'rspec/rails'
#require 'rspec/autorun'
#
## Requires supporting ruby files with custom matchers and macros, etc,
## in spec/support/ and its subdirectories.
#Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
#
## Checks for pending migrations before tests are run.
## If you are not using ActiveRecord, you can remove this line.
#ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)
#
#RSpec.configure do |config|
#  config.fixture_path = "#{::Rails.root}/spec/fixtures"
#
#  config.use_transactional_fixtures = true
#
#  config.infer_base_class_for_anonymous_controllers = false
#
#  config.order = "random"
#  config.include(MailerMacros)
#  config.include FactoryGirl::Syntax::Methods
#end
require 'rubygems'
require 'spork'
require 'database_cleaner'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  RSpec.configure do |config|
    config.use_transactional_fixtures = false
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"

    config.before :each do
      if Capybara.current_driver == :selenium
        DatabaseCleaner.strategy = :truncation
      else
        DatabaseCleaner.strategy = :transaction
      end
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    # Include Factory Girl syntax to simplify calls to factories
    config.include FactoryGirl::Syntax::Methods
  end
end

Spork.each_run do
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  FactoryGirl.reload
end
