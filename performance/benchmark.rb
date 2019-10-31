require "bundler/inline"
require "rails_json_gem_encoder"
require "benchmark/ips"

str = "this is the <string> & \u2028 \u2029"

Benchmark.ips do |x|
  x.report("JSONGemEncoder") do
    ActiveSupport::JSON::Encoding.json_encoder = ActiveSupport::JSON::Encoding::JSONGemEncoder
    ActiveSupport::JSON.encode(str)
  end

  x.report("RailsJSONGemEncoder") do
    ActiveSupport::JSON::Encoding.json_encoder = RailsJSONGemEncoder
    ActiveSupport::JSON.encode(str)
  end
  x.compare!
end
