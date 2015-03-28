module Alphasms
  module Configuration
    DefaultConfig = Struct.new(:api_key, :api_login, :api_password, :sender, :type) do
      def initialize
        self.api_key = nil
        self.api_login = nil
        self.api_password = nil
        self.sender = nil
        self.type = 0
      end
    end

    def self.configure
      @config = DefaultConfig.new
      yield(@config) if block_given?
      @config
    end

    def self.config
      @config || configure
    end
  end
end