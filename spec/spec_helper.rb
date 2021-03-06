ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require "capybara/rspec"
require "bundler/setup"
::Bundler.require(:default, :test)

::Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec
    #with.test_framework :minitest
    #with.test_framework :minitest_4
    #with.test_framework :test_unit

    # Choose one or more libraries:
    with.library :active_record
    with.library :active_model
    #with.library :action_controller
    # Or, choose the following (which implies all of the above):
    #with.library :rails
  end
end 

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  ActiveRecord::Migration.maintain_test_schema!
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
