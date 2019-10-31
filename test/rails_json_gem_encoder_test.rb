require "test_helper"

class RailsJSONGemEncoderTest < Minitest::Test
  def test_escape
    assert_equal "this is the \\u003cstring\\u003e \\u0026 \\\\u2028 \\\\u2029", RailsJSONGemEncoder.escape("this is the <string> & \u2028 \u2029")
  end
end
