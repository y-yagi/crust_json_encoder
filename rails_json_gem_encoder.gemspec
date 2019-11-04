lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "rails_json_gem_encoder"
  spec.authors       = ["Yuji Yaginuma"]
  spec.email         = ["yuuji.yaginuma@gmail.com"]
  spec.version       = "0.0.1"
  spec.homepage      = "https://github.com/y-yagi/rails_json_gem_encoder"

  spec.summary       = %q{RailsJSONGemEncoder is a patch of Rails's JSON encoder for better performance.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/Rakefile"]

  spec.add_dependency "activesupport"
  spec.add_dependency "rutie"
  spec.add_dependency "thermite"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "benchmark-ips"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"
end
