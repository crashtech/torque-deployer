
module Torque
  module Deployer
  	class Json
  		def self.read
        jsonData = JSON.parse(File.read('data.json'))
        return jsonData
  		end

  		def self.write
  			File.open('data.json', 'w') do |file|
          file.puts "{ \"test\" : \"#{Time.now.to_s}\"}"
        end
  		end
  	end
  end
end
