require 'simplecov'

module SimpleCov
  # SimpleCov configuration
  module Configuration
    def clean_filters
      @filters = []
    end
  end
end

SimpleCov.configure do
  clean_filters
  load_profile 'test_frameworks'
end

ENV['COVERAGE'] && SimpleCov.start do
  add_filter '/.rvm/'
  add_filter '/.rubies/'
  add_filter '/vendor/'
end

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rspec'
require 'rakuna/data/redis'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
