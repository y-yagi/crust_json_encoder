require "active_support"
require "active_support/json"

begin
  require "crust_json_encoder/#{RUBY_VERSION.to_f}/crust_json_encoder"
rescue LoadError
  require "crust_json_encoder/crust_json_encoder"
end

class CrustJSONEncoder < ActiveSupport::JSON::Encoding::JSONGemEncoder
  private

  def jsonify(value)
    value.is_a?(String) ? value : super
  end

  def stringify(jsonified)
    jsonified.is_a?(String) ? JSONEscaper.escape(super) : super
  end
end
