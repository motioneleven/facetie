# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'facetie/version'

Gem::Specification.new do |spec|
  spec.name          = "facetie"
  spec.version       = Facetie::VERSION
  spec.authors       = ["Mathieu Gagné"]
  spec.email         = ["mathieu@motioneleven.com"]
  spec.description   = %q{Adds a Presenter for Sunspot::Facet with a quick helper facet_item for your views.}
  spec.summary       = %q{Adds a Presenter for Sunspot::Facet with a quick helper facet_item for your views.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
