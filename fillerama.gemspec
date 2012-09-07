# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fillerama/version'

Gem::Specification.new do |gem|
  gem.name          = 'fillerama'
  gem.version       = Fillerama::VERSION
  gem.authors       = ['Neal Clark']
  gem.email         = ['nclark@thrownproject.com']
  gem.description   = %q{WINDMILLS DO NOT WORK THAT WAY}
  gem.summary       = %q{fillerama is a gem to quickly pull quotes from Chris Valleskey's fillerama API.}
  gem.homepage      = 'http://github.com/nclark/fillerama'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'htmlentities', '~> 4.3.1'
  gem.add_runtime_dependency 'rest-client',  '~> 1.6.7'
  gem.add_development_dependency 'rspec',    '~> 2.11.0'
  gem.add_development_dependency 'vcr',      '~> 2.2.4'
  gem.add_development_dependency 'webmock',  '~> 1.8.9'
end
