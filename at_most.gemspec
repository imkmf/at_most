# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'at_most/version'

Gem::Specification.new do |spec|
  spec.name          = "at_most"
  spec.version       = AtMost::VERSION
  spec.authors       = ["Kristian Freeman"]
  spec.email         = ["kristian@kristianfreeman.com"]
  spec.description   = %q{Limit your ActiveRecord models}
  spec.summary       = %q{A simple extension to ActiveRecord to allow limiting of model creation via validation. This gem was extracted out of a Rails app function that limited the number of users that could be created with CRUD access to a different AR model.}
  spec.homepage      = "https://github.com/imkmf/at_most"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sqlite3"
end
