module Alphasms
  module Requests
    class Xml

      API_URI = 'http://alphasms.ua/api/xml.php'

      def initialize options
        @options = options
      end

      def balance
        request package_xml { |xml| xml.balance }
      end

      def status sms_ids
        xml = package_xml do |xml|
          xml.status {
            [sms_ids].flatten.each do |id|
              xml.msg(sms_id: id.to_s)
            end
          }
        end

        request xml
      end

      def deliver collection
        xml = package_xml do |xml|
          xml.message {
            collection.each do |sms|
              msg_opt = sms.to_h.select { |_,v| !v.nil? }
              xml.msg(msg_opt) {
                xml << sms.message
              }
            end
          }
        end

        request xml
      end

      private

      def package_xml
        Nokogiri::XML::Builder.new(encoding:'utf-8') do |xml|
          xml.package(key: @options[:api_key]) {
            yield xml
          }
        end.to_xml
      end

      def request body
        uri = URI(API_URI)
        req = Net::HTTP::Post.new(uri.request_uri)
        req.body = body
        req.content_type = 'text/xml'

        http = Net::HTTP.new(uri.host)
        http.request(req).body
      end
    end
  end
end