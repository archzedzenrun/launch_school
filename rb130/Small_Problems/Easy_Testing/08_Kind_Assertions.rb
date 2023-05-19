require 'minitest/autorun'

class KindTest < MiniTest::Test
  def test_kind
    value = 1
    assert_kind_of(Numeric, value)
  end
end