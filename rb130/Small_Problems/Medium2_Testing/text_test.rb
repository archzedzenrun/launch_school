require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample_text.txt', 'r')
    @txt = @file.read
    @test_text = Text.new(@txt)
  end

  def test_swap
    swapped = @test_text.swap('a', 'e')
    assert_equal(0, swapped.count('a'))
  end

  def test_wordcount
    assert_equal(@txt.split.size, @test_text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end