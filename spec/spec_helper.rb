require 'coveralls'
require 'simplecov'

Coveralls.wear!

SimpleCov.formatter = SimpleCov::Formatter::HTMLFormatter
SimpleCov.start

require './lib/kudomon.rb'
require './lib/trainer.rb'
require './lib/kudomons.rb'
require './lib/geospace.rb'
require './lib/multiplayer_capture_controller.rb'
require './lib/battle_controller.rb'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  # if config.files_to_run.one?
  #   config.default_formatter = 'doc'
  # end

  # config.profile_examples = 10
  # config.order = :random

  # Kernel.srand config.seed

end
