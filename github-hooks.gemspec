# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'github/hooks/version'

Gem::Specification.new do |spec|
  spec.name          = "github-hooks"
  spec.version       = Github::Hooks::VERSION
  spec.authors       = ["Konboi"]
  spec.email         = ["ryosuke.yabuki@gmail.com"]
  spec.summary       = %q{github-hooks is tools for github hooks. github-hooks can create hook job and hook event easily.}
  spec.homepage      = "https://github.com/Konboi/github-hooks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rack"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "yard"
  spec.add_development_dependency "rspec", "2.14.1"
  spec.add_development_dependency "rack-test"
  spec.add_development_dependency "rerun"
end
