# frozen_string_literal: true

require 'require_all'
require 'pry'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..'))

require_all 'lib'
require_all 'spec/helpers'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
