require "rutie"
require "active_support"
require "active_support/json"
require "thermite/config"

class CrustJSONEncoder < ActiveSupport::JSON::Encoding::JSONGemEncoder
  LIB_PATH = begin
    toplevel_dir = File.dirname(__dir__)
    config = Thermite::Config.new(cargo_project_path: toplevel_dir, ruby_project_path: toplevel_dir)
    config.ruby_path("lib")
  end

  Rutie.new(:native, lib_path: LIB_PATH, lib_prefix: nil).init "Init_native", __dir__

  private

  def jsonify(value)
    value.is_a?(String) ? value : super
  end

  def stringify(jsonified)
    jsonified.is_a?(String) ? JSONEscaper.escape(super) : super
  end
end
