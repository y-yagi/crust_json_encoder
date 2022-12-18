require "active_support"
require "active_support/json"
require "crust_json_encoder/crust_json_encoder"

class CrustJSONEncoder < ActiveSupport::JSON::Encoding::JSONGemEncoder
  private

  def jsonify(value)
    value.is_a?(String) ? value : super
  end

  def stringify(jsonified)
    jsonified.is_a?(String) ? JSONEscaper.escape(super) : super
  end
end
