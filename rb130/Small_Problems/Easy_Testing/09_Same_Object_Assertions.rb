require 'minitest/autorun'

class List
  def process
    self
  end
end

class SameTest < MiniTest::Test
  def test_same
    list = List.new
    assert_same(list, list.process)
  end
end