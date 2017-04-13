require 'torque-deployer'
require 'rspec'
require 'byebug'

RSpec.configure do |config|
  config.formatter = :documentation
  config.color     = true
  config.tty       = true
end
