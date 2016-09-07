# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paperclip/remote_assets/version'

Gem::Specification.new do |spec|
  spec.name          = "paperclip-remote_assets"
  spec.version       = Paperclip::RemoteAssets::VERSION
  spec.authors       = ["vala"]
  spec.email         = ["gonjo@free.fr"]

  spec.summary       = %q{Use remote assets on your local dev env}
  spec.description   = %q{Rack middleware to make missing local paperclip assets fall back to remote ones}
  spec.homepage      = "https://github.com/glyph-fr/paperclip-remote_assets"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 3.1"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
