module Alphasms
  module Parsers
    class ResponseError < StandardError; end

    class Xml
      def parse_balance xml
        doc = Nokogiri::XML(xml)

        if ((amount = doc.search('amount')).empty? || (currency = doc.search('currency')).empty?)
          raise ResponseError, 'Invalid response'
        end

        result = Struct.new(:amount, :currency).new
        result.amount   = amount.text.to_f
        result.currency = currency.text.to_s

        result
      end

      def parse_status xml
        doc = Nokogiri::XML(xml)

        if ((msg = doc.search('msg')).empty?)
          raise ResponseError, 'Invalid response'
        end

        msg.map do |item|
          date_completed_attr = item.attr('date_completed').to_s
          completed_at = date_completed_attr.empty? ? nil : Date.parse(date_completed_attr, false)
          SmsStatus.new(
              item.attr('id').to_i,
              item.attr('sms_id').to_i,
              item.attr('sms_count').to_i,
              completed_at,
              item.text.to_i,
          )
        end
      end

      def parse_deliver xml
        parse_status xml
      end
    end
  end
end