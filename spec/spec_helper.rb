require 'kosapi_cli'

Dir['./spec/helpers/**/*.rb'].sort.each { |f| require f }

RSpec.configure do |config|
  # Include helpers
  config.include IOTestHelpers
  config.include FileTestHelpers
end
