# frozen_string_literal: true

ENV["APP_ENV"] = "test"
ENV["RACK_ENV"] = "test"

require "rack/test"
require_relative "../boot"

Dir[File.expand_path(File.join(File.dirname(__FILE__), "support", "**", "*.rb"))].each do |f|
  require f
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.warnings = true
  config.order = :random

  config.include WebApplicationHelper
end
