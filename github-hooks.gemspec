# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github/hooks/version'

Gem::Specification.new do |spec|
  spec.name          = "github-hooks"
  spec.version       = Github::Hooks::VERSION
  spec.authors       = ["Konboi"]
  spec.email         = ["ryosuke.yabuki@gmail.com"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_dependency "rack", "~> 1.5.2"
  spec.add_development_dependency "rspec", "2.14.1"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rerun"
end
