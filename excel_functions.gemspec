# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'excel_functions/version'

Gem::Specification.new do |spec|
  spec.name          = "excel_functions"
  spec.version       = ExcelFunctions::VERSION
  spec.authors       = ["Karthik T"]
  spec.email         = ["karthikt.holmes+github@gmail.com"]
  spec.description   = %q{Reverse engineered versions of some Excel functions}
  spec.summary       = %q{This gem can be used if you need to reverse engineer any excel spreadsheets.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
