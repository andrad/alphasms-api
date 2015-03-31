require 'spec_helper'
require 'alphasms/parsers/xml'

module Alphasms
  describe 'Alphasms::Parsers::Xml' do
    let(:parser) { Parsers::Xml.new }

    it '#check_error returns ApiError' do
      xml = <<XML
<?xml version="1.0" encoding="utf-8" ?>
<package>
  <error>209</error>
</package>
XML
      expect { parser.check_error Nokogiri::XML(xml) }.to raise_error ApiError
    end

    it '#parse_balance should respond to :amount' do
      xml = <<XML
<?xml version="1.0" encoding="utf-8" ?>
<package>
  <balance>
    <amount>164.719700000656</amount>
    <currency>UAH</currency>
  </balance>
</package>
XML
      expect(parser.parse_balance xml).to respond_to(:amount)
    end

    it '#parse_status returns collection of objects of class Struct::SmsStatus' do
      xml = <<XML
<?xml version="1.0" encoding="utf-8" ?>
<package>
  <message>
    <msg id="1" sms_id="0" sms_count="0">203</msg>
  </message>
</package>
XML
      expect(parser.parse_status(xml).first.class).to eq Struct::SmsStatus
    end
  end
end