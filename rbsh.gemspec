# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbsh/version'

Gem::Specification.new do |gem|
  gem.name          = "rbsh"
  gem.version       = Rbsh::VERSION
  gem.authors       = ["Ryosuke IWANAGA"]
  gem.email         = ["riywo.jp@gmail.com"]
  gem.description   = %q{Ruby-sh shell script}
  gem.summary       = %q{Yet Another shell script like ruby}
  gem.homepage      = "https://github.com/riywo/rbsh"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'thor', '>= 0.13.6'

  gem.add_development_dependency 'rake', '>= 0.9.2.2'
  gem.add_development_dependency 'rspec'
end
