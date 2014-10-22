# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-key-value-sum"
  spec.authors       = ["Masayuki DOI"]
  spec.email         = ["dotquasar@gmail.com"]
  spec.description   = "plugin for count same key's value"
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/mdoi/fluent-plugin-key-value-sum"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
