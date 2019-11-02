require "rutie"
require "active_support"
require "active_support/json"

class RailsJSONGemEncoder < ActiveSupport::JSON::Encoding::JSONGemEncoder
  Rutie.new(:native).init "Init_native", __dir__

  private

  def jsonify(value)
    value.is_a?(String) ? value : super
  end

  def stringify(jsonified)
    jsonified.is_a?(String) ? JSONEscaper.escape(super) : super
  end
end
