require 'spec_helper'
require 'alphasms/builder'

module Alphasms
  describe 'Alphasms::Builder' do
    let(:builder) { Builder.build(Alphasms.config.to_h.merge(format: :xml)) }

    it 'should have method .request of class Alphasms::Requests::Xml' do
      expect(builder.request.class).to eq Alphasms::Requests::Xml
    end

    it 'should have method .parser of class Alphasms::Parsers::Xml' do
      expect(builder.parser.class).to eq Alphasms::Parsers::Xml
    end
  end
end
