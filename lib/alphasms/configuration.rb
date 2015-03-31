module Alphasms
  module Configuration

    module ClassMethods
      DefaultConfig = Struct.new(:api_key, :format, :sender, :type) do
        def initialize
          self.api_key = 'Key'
          self.format  = :xml
          self.sender  = 'Sender'
          self.type    = 0
        end
      end

      def configure
        @config = DefaultConfig.new
        yield(@config) if block_given?
        @config
      end

      def config
        @config ||= configure
        @config
      end
    end

    extend ClassMethods

    def self.included other
      other.extend ClassMethods
    end
  end
end

Alphasms.send(:include, Alphasms::Configuration)