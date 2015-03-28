module Alphasms
  module Generators
    class Initializer_Generator < ::Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a simple Alphasms initializer.'

      def copy_initializer
        copy_file 'alphasms.rb', 'config/initializers/alphasms.rb'
      end
    end
  end
end