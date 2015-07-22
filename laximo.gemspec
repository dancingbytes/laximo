# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'laximo/version'

Gem::Specification.new do |spec|
  spec.name          = "laximo"
  spec.version       = SmsRu::VERSION
  spec.authors       = ["Ivan Piliaiev"]
  spec.email         = ["piliaiev@gmail.com"]
  spec.description   = %q{Api for Laximo servises}
  spec.summary       = %q{Api for Laximo servises}
  spec.homepage      = "https://github.com/dancingbytes/laximo"
  spec.license       = "BSD"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency "nokogiri"

end
