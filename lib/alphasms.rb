require 'alphasms/version'
require 'alphasms/configuration'

module Alphasms
  extend Configuration

  def self.test
    puts 'test'
  end
end
