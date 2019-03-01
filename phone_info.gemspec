
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "phone_info/version"

Gem::Specification.new do |spec|
  spec.name          = "phone_info"
  spec.version       = PhoneInfo::VERSION
  spec.authors       = ["Andersen Fan"]
  spec.email         = ["as181920@gmail.com"]

  spec.summary       = %q{Phone info}
  spec.description   = %q{province, city, region code, postal code, isp}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 5.0"
end
