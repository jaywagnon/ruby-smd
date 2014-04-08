# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smd/version'

Gem::Specification.new do |spec|
  spec.name          = "smd"
  spec.version       = SmD::VERSION
  spec.authors       = ["Tim Shadel", "Jay Wagnon"]
  spec.email         = ["tim@shadelsoftware.com", "jaywagnon@gmail.com"]
  spec.description   = %q{A Ruby implementation of Time Shadel's SmD (Small Dates) project.}
  spec.summary       = %q{A Ruby implementation of Time Shadel's SmD (Small Dates) project.}
  spec.homepage      = "https://github.com/jaywagnon/ruby-smd"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
end
