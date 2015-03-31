module Alphasms
  module Configuration
    def included(base)
      base.extend ClassMethods
    end

    DefaultConfig = Struct.new(:api_key, :api_login, :api_password, :sender, :type, :format) do
      def initialize
        self.api_key = 'Key'
        self.sender = 'Sender'
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
  end

  def included(mod)
    puts "#{self} included in #{mod}"
  end
end