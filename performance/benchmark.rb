require "bundler/inline"
require "rails_json_gem_encoder"
require "benchmark/ips"


ESCAPED_CHARS = {
  "\u2028" => '\u2028',
  "\u2029" => '\u2029',
  ">"      => '\u003e',
  "<"      => '\u003c',
  "&"      => '\u0026',
}
ESCAPE_REGEX_WITH_HTML_ENTITIES = /[\u2028\u2029><&]/u
ESCAPE_REGEX_WITHOUT_HTML_ENTITIES = /[\u2028\u2029]/u

def escape(s)
  s.gsub! ESCAPE_REGEX_WITH_HTML_ENTITIES, ESCAPED_CHARS
  s
end

str = "this is the <string> & \u2028 \u2029"

Benchmark.ips do |x|
  x.report("Ruby") do
    escape(str)
  end

  x.report("Rust") do
    RailsJSONGemEncoder.escape(str)
  end
  x.compare!
end
