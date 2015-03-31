require 'alphasms/version'
require 'alphasms/builder'
require 'alphasms/configuration'
require 'nokogiri'
require 'open-uri'
require 'net/http'
require 'pry'

module Alphasms
  class OptionError < StandardError; end

  SmsStatus = Struct.new('SmsStatus', :id, :sms_id, :sms_count, :completed_at, :status)
  Sms       = Struct.new('Sms', :id, :recipient, :message, :sender, :type, :url, :date_beg, :date_end)
  # Config    = Struct.new('Config', :api_key, :api_login, :api_password, :sender, :format, :type) do
  #   def initialize
  #     self.api_key = 'Key'
  #     self.sender = 'Sender'
  #     self.format = :xml
  #     self.type = 0
  #   end
  # end

  class << self
    # def config
    #   Config.new
    # end

    def balance options = {}
      builder = prepare options
      response = builder.request.balance
      result = builder.parser.parse_balance response
      block_given? ? yield(result) : result
    end

    def status sms_ids, options = {}
      builder = prepare options
      response = builder.request.status sms_ids
      result = builder.parser.parse_status response
      block_given? ? yield(result) : result
    end

    def deliver data, options = {}
      builder = prepare options
      collection = case data
      when Array
        data.map { |item| prepare_deliver_params(item) }
      when Hash
        [prepare_deliver_params(data)]
      else
        raise ::ArgumentError, 'Invalid argument'
      end

      response = builder.request.deliver collection
      builder.parser.parse_deliver response
    end

    def prepare_deliver_params data
      sms = Sms.new
      sms.id        = data[:id]
      sms.recipient = data[:recipient]
      sms.message   = data[:message]
      sms.sender    = data[:sender] || @options[:sender]
      sms.type      = (data[:type] || @options[:type]).to_i
      sms.url       = data[:url] if sms.type.eql? 2
      sms.date_beg  = data[:date_beg]
      sms.date_end  = data[:date_end]
      sms
    end

    def prepare options = {}
      @options = config.to_h.merge(options)

      raise OptionError, 'Invalid value for option :format' unless @options[:format]
      raise OptionError, 'Invalid value for option :api_key' unless @options[:api_key]

      Builder.build @options
    end

  end
end
