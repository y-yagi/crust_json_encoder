require "helix_runtime"
require "rails_json_gem_encoder/native"
require "active_support"
require "active_support/json/encoding"

class RailsJSONGemEncoder < ActiveSupport::JSON::Encoding::JSONGemEncoder
  private

  def jsonify(value)
    value.is_a?(String) ? JSONEscaper.escape(value) : super
  end
end
