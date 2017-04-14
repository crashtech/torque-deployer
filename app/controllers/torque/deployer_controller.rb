module Torque
  class DeployerController < Torque::Deployer.config.base_controller
    layout 'torque_deployer'

    def index
    end

    def settings
      if request.get?
        @command = 'git push -f origin %{BRANCH}:staging'
      else
        redirect_to root_path, notice: 'Settings saved successfully!'
      end
    end

  end
end
