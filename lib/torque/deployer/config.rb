module Torque
  module Deployer
    include ActiveSupport::Configurable

    # Name of the base route for deployer
    config.route = :deployer

    # Base controller class to be inherited
    config.base_controller = ActionController::Base

  end
end
