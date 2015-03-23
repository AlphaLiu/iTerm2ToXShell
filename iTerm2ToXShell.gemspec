# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iTerm2ToXShell/version'

Gem::Specification.new do |spec|
  spec.name          = "iTerm2ToXShell"
  spec.version       = ITerm2ToXShell::VERSION
  spec.authors       = ["Alpha Liu"]
	spec.email         = ["alpha.liu@me.com"]

  spec.summary       = %q{A toolkit that convert iTerm2 color schemes to XShell format}
  spec.description   = %q{Convert iTerm2 color schemes to XShell format}
	spec.homepage      = "https://github.com/AlphaLiu/iTerm2ToXShell"
	spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

	spec.add_runtime_dependency "thor", "~> 0.19.1"
	spec.add_runtime_dependency "agile_utils", "~> 0.2.3"
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency 'awesome_print', '~> 1.2', '>= 1.2.0'
end
