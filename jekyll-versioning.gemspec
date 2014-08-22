# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/versioning/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-versioning"
  spec.version       = Jekyll::Versioning::VERSION
  spec.authors       = ["Ivan Tse"]
  spec.email         = ["ivan.tse1@gmail.com"]
  spec.summary       = %q{Version your Jekyll site.}
  spec.description   = %q{Create multiple versions of your Jekyll website using Git tags}
  spec.homepage      = "https://github.com/ivantsepp/jekyll-versioning"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "jekyll", '~> 2.1'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "shoulda"
  spec.add_development_dependency "mocha"
end
