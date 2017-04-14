module Torque
  module Deployer
    module Mapper
      class << self
      def find_or_create(source, klass, data)
        list_name = klass.name.underscore.pluralize
        list = Payload.send(list_name)

        searcher = IDENTIFIERS["#{source}.#{klass.name.underscore}"][klass::IDENTIFIED_BY]
        identifier = searcher.call(data)

        list[identifier] ||= perform_for(source, klass, data)
      end

      def perform_for(source, klass, data)
        obj = klass.new
        identifiers = IDENTIFIERS["#{source}.#{klass.name.underscore}"]
        identifiers.each { |key, value|
          obj.send("#{key}=", identifiers[key].call(data))
        }
      end

      IDENTIFIERS = {
        'github.branch' => {
          ref: -> (d) { |d| d['ref'] },
          type: -> (d) { |d| d['ref_type'] || 'branch'}
        }

        'github.pull_request' => {
          id: -> (d) { |d| d['number'] },
          head: -> (d) { |d| find_or_create('github', Branch, d['head']) },
          title: -> (d) { |d| d['title'] },
          url: -> (d) { |d| d['html_url'] },
          updated_at: -> (d) { |d| Time.parse(d['updated_at'])}
        }
      }
      end
    end
  end
end

