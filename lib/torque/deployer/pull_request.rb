module Torque
  module Deployer
    class Pull_request < Struct.new(:id, :head, :title, :url, :updated_at)
      IDENTIFIED_BY = :id
      class << self

      end
    end
  end
end
