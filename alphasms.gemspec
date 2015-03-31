# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alphasms/version'

Gem::Specification.new do |spec|
  spec.name          = 'alphasms'
  spec.version       = Alphasms::VERSION
  spec.authors       = ['Andrew Radzun']
  spec.email         = ['andrad.work@gmail.com']

  spec.summary       = %q{The short summary.}
  spec.description   = %q{The longer description.}
  spec.homepage      = 'https://github.com/andrad/alphasms'

  spec.license       = 'MIT'

  # spec.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ['lib', 'lib/alphasms']

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  # end

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'nokogiri', '~> 1.6'
  spec.add_development_dependency 'pry', '~> 0.10'
  spec.add_development_dependency 'rspec', '~> 3.2'
end
