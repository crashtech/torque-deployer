
module Torque
  module Deployer
  	module Payload
      VERSION = '0.1.0'

  		class << self
        # These attributes require that the payload is loaded
        [:version, :branches, :pull_requests, :command, :current, :secret].each do |attribute|
          define_method(attribute) do
            load
            @payload.send(attribute)
          end
        end

        # Create basic data file
        def init(secret = nil)
          @payload = OpenStruct.new(branches: {}, pull_requests: {}, secret: secret,
            version: VERSION)
          save
        end

        # Load data to payload from file if not loaded
        def load
          load! if load?
        end

        # Load data to payload from file
        def load!
          @payload = Marshal.load(data_path.read)
        end

        # Save payload to file
        def save
          data_path.write(Marshal.dump(@payload))
        end

        # Check if data has been loaded into payload
        def load?
          @payload.present?
        end

        # Check if data has ever been configured
        def initialized?
          data_path.file?
        end

        private
          # Configuration data path
          def data_path
            @data_path ||= Pathname.pwd.join('data')
          end
      end
  	end
  end
end
