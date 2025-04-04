require 'capybara/rspec'
require 'capybara/cuprite'

Capybara.server = :puma
Capybara.javascript_driver = :cuprite
Capybara.register_driver :cuprite do |app|
  opts = {
    window_size: [1280, 800],
    timeout: 10 # default 5
  }
  Capybara::Cuprite::Driver.new(app, **opts)
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each, type: :system) do
    driven_by :cuprite
    Capybara.always_include_port = true
  end

  config.example_status_persistence_file_path = 'spec/examples.txt'
end

if ENV['DD_ENV'] == 'ci'
  # ENV['DD_CIVISIBILITY_FLAKY_RETRY_COUNT'] = '5' # default
  ENV['DD_CIVISIBILITY_FLAKY_RETRY_COUNT'] = '2'
  # ENV['DD_CIVISIBILITY_TOTAL_FLAKY_RETRY_COUNT'] = '1000' # default)
  ENV['DD_CIVISIBILITY_TOTAL_FLAKY_RETRY_COUNT'] = '10'

  require 'datadog/ci'

  Datadog.configure do |c|
    c.ci.enabled = true
    c.service = 'sample-ci-test'
    c.ci.instrument :rspec
  end
end
