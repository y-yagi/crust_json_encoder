require "helix_runtime"
require "rails_json_gem_encoder/native"
require "active_support"
require "active_support/json/encoding"

class RailsJSONGemEncoder < ActiveSupport::JSON::Encoding::JSONGemEncoder
  private

  class EscapedString < String
    def to_json(*)
      s = super
      JSONEscaper.escape(s)
    end

    def to_s
      self
    end
  end

  def jsonify(value)
    value.is_a?(String) ? EscapedString.new(value) : super
  end
end
