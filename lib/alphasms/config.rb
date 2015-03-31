require 'active_support/configurable'

module Alphasms

  def self.configure(&block)
    yield @config ||= Alphasms::Configuration.new
  end

  # Global settings for GmapCoordinatesPicker
  def self.config
    @config
  end

  # need a Class for 3.0
  class Configuration
    include ActiveSupport::Configurable
    config_accessor :api_key
    config_accessor :sender
    config_accessor :format
    config_accessor :type
  end

  configure do |config|
    config.api_key = 'Key'
    config.sender = 'Sender'
    config.format = :xml
    config.type = 0
  end
end