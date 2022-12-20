lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "crust_json_encoder"
  spec.authors       = ["Yuji Yaginuma"]
  spec.email         = ["yuuji.yaginuma@gmail.com"]
  spec.version       = "0.0.7"
  spec.homepage      = "https://github.com/y-yagi/crust_json_encoder"

  spec.summary       = %q{CrustJSONEncoder is a JSON encoder for Ruby on Rails.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|performance)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/crust_json_encoder/extconf.rb"]

  spec.add_dependency "activesupport"
  spec.add_dependency "rb_sys"
  spec.add_development_dependency "rake-compiler"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "benchmark-ips"
  spec.add_development_dependency "debug"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"
end
