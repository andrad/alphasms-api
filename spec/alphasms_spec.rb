require 'spec_helper'

module Alphasms
  describe 'Alphasms.prepare' do
    it 'fails if option \':api_key\' is not specified' do
      expect { Alphasms.prepare({ api_key: nil }) }.to raise_error OptionError
    end

    it 'fails if option \':format\' is not specified' do
      expect { Alphasms.prepare({ format: nil }) }.to raise_error OptionError
    end

    it 'returns object of class Alphasms::Builder' do
      expect(Alphasms.prepare.class).to eq Alphasms::Builder
    end
  end

  describe 'Alphasms.balance' do
    it 'returns amount and currency' do
      expect(Alphasms.balance { |s| "amount: #{s.amount}, currency: #{s.currency}" }).to match /amount: ([\d\.]+), currency: ([A-Z]{3})/
    end
  end

  describe 'Alphasms.status' do
    it 'returns collection of objects of class Struct::SmsStatus' do
      expect(Alphasms.status('0').first.class).to eq Struct::SmsStatus
    end
  end

  describe 'Alphasms.deliver' do
    let(:statuses) { Alphasms.deliver({ recipient: 'SOME PHONE', message: 'MESSAGE', id: '1' }) }

    it 'returns collection of objects of class Struct::SmsStatus' do
      expect(statuses.first.class).to eq Struct::SmsStatus
    end

    it 'should have id' do
      expect(statuses.first.id).to eq 1
    end

    it 'should have code of error' do
      expect(statuses.first.status).to be >= 200
    end
  end
end