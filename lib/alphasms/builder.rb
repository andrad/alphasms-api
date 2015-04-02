require 'alphasms/parsers/xml'
require 'alphasms/requests/xml'

module Alphasms
  class Builder
    class << self
      def build options
        @klass = options.delete(:format).to_s.capitalize

        build_request options
        build_parser

        new @request, @parser
      end

      def build_request options
        @request = Alphasms::Requests.const_get(@klass).new options
      end

      def build_parser
        @parser = Alphasms::Parsers.const_get(@klass).new
      end
    end

    attr_reader :request, :parser

    def initialize request, parser
      @request = request
      @parser = parser
    end
  end
end