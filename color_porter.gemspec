# -*- encoding: utf-8 -*-
require File.expand_path('../lib/color_porter/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Nathan Bertram"]
  gem.email         = ["nbertram@gmail.com"]
  gem.description   = %q{Color Porter does the heavy lifting when working Hex & RGB in Ruby}
  gem.summary       = %q{Work directly with Hex & RGB objects in Ruby}
  gem.homepage      = "http://github.com/nathanbertram/color_porter"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "color_porter"
  gem.require_paths = ["lib"]
  gem.version       = ColorPorter::VERSION
  gem.license       = 'MIT'

  gem.add_development_dependency('rspec')
end
