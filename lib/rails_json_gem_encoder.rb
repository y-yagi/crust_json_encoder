require "rutie"
require "active_support"
require "active_support/json/encoding"

class RailsJSONGemEncoder < ActiveSupport::JSON::Encoding::JSONGemEncoder
  Rutie.new(:native).init "Init_native", __dir__

  private

  class EscapedString < String
    def to_json(*)
      JSONEscaper.escape(super)
    end

    def to_s
      self
    end
  end

  def jsonify(value)
    value.is_a?(String) ? EscapedString.new(value) : super
  end
end
