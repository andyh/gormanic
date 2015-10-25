# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gormanic/version'

Gem::Specification.new do |spec|
  spec.name          = "gormanic"
  spec.version       = Gormanic::VERSION
  spec.authors       = ["Andy Henson"]
  spec.email         = ["andy@elaptics.co.uk"]

  spec.summary       = %q{Gormanic: A more sensible date system}
  spec.description   = %q{Dave Gorman proposed a more sensible date system:- this is a ruby implementation of it}
  spec.homepage      = "http://github.com/andyh/gormanic"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
