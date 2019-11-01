require "rutie"
require "rails_json_gem_encoder/rails_json_gem_encoder"
require "active_support"
require "active_support/json/encoding"

class RailsJSONGemEncoder < ActiveSupport::JSON::Encoding::JSONGemEncoder
  Rutie.new(:rails_json_gem_encoder).init "Init_rails_json_gem_encoder", __dir__

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
