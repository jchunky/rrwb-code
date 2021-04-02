require "active_support/all"
relative_load_paths = %w[lib]
ActiveSupport::Dependencies.autoload_paths += relative_load_paths

RSpec.configure do |config|
  config.expect_with(:rspec) { |c| c.syntax = :should }
end
