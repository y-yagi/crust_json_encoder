require "test_helper"

class RailsJSONGemEncoderTest < Minitest::Test
  def test_escape
    assert_equal "this is the \\u003cstring\\u003e", RailsJSONGemEncoder.escape("this is the <string>")
  end
end
