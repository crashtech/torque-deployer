module Torque
  module Deployer
    module Routing

      # Create all the deployer routes
      def deployer_routes
        scope(Torque::Deployer.config.route, controller: 'torque/deployer') do
          get '/:action'
          get :command
          put :command
          post :deploy
          root action: :index
        end
      end

    end

    ActionDispatch::Routing::Mapper.include Routing
  end
end
