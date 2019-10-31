require "test_helper"

class RailsJSONGemEncoderTest < Minitest::Test
  StringTests   = [[ "this is the <string>",     %("this is the \\u003cstring\\u003e")],
                   [ 'a "string" with quotes & an ampersand', %("a \\"string\\" with quotes \\u0026 an ampersand") ],
                   [ "http://test.host/posts/1", %("http://test.host/posts/1")],
                   [ "Control characters: \x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f\x10\x11\x12\x13\x14\x15\x16\x17\x18\x19\x1a\x1b\x1c\x1d\x1e\x1f\u2028\u2029",
                       %("Control characters: \\u0000\\u0001\\u0002\\u0003\\u0004\\u0005\\u0006\\u0007\\b\\t\\n\\u000b\\f\\r\\u000e\\u000f\\u0010\\u0011\\u0012\\u0013\\u0014\\u0015\\u0016\\u0017\\u0018\\u0019\\u001a\\u001b\\u001c\\u001d\\u001e\\u001f\\u2028\\u2029") ]]

  def setup
    ActiveSupport::JSON::Encoding.json_encoder = RailsJSONGemEncoder
  end

  def test_string
    StringTests.each do |input, expected|
      assert_equal expected, ActiveSupport::JSON.encode(input)
    end
  end
end
