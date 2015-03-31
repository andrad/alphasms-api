module Alphasms
  module Configuration
    def included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      DefaultConfig = Struct.new(:api_key, :api_login, :api_password, :sender, :type) do
        def initialize
          self.api_key = '3bcd7848b218777a344f8e2d5e0e5e5bf7f9b780'
          self.sender = 'Deshevshe'
          self.format = :xml
          self.type = 0
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

      def extended(mod)
        puts "#{self} extended in #{mod}"
      end

      def included(mod)
        puts "#{self} included in #{mod}"
      end
    end
  end
end

Alphasms.send(:include, Alphasms::Configuration)