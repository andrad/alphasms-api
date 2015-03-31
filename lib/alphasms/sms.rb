module Alphasms
  class Sms
    attr_reader :adapter, :options

    def initialize adapter, options={}
      @adapter = adapter
      @options = options
      @status  = nil
    end

    def send

    end

  end
end