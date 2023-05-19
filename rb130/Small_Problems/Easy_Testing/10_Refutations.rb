require 'minitest/autorun'

class RefuteTest < MiniTest::Test
  def test_refute
    list = ['xzy']
    refute_includes(list, 'xyz')
  end
end