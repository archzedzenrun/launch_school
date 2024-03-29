require 'simplecov'
require 'minitest/autorun'
require "minitest/reporters"

SimpleCov.start
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list.add('test') }
  end

  def test_add
    assert_equal(4, @list.add(@todo1).size)
  end

  def test_shovel
    assert_equal(4, @list.<<(@todo1).size)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(5) }
    assert_equal(@todo1, @list.item_at(0))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(5) }
    @list.mark_done_at(1)
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(5) }
    @list.mark_all_done
    @list.mark_undone_at(1)
    assert_equal(true, @todo1.done?)
    assert_equal(false, @todo2.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(5) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    assert_equal(output, @list.to_s)
  end

  def test_to_s_2
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
    @list.mark_done_at(0)
    assert_equal(output, @list.to_s)
  end

  def test_to_s_3
    output = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT
    @list.mark_all_done
    assert_equal(output, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal(result, @list.to_a)
  end

  def test_each_2
    assert_equal(@list.each(&:to_s), @list)
  end

  def test_select
    result = @list.select(&:done?)
    different_objects = result.object_id != @list.object_id
    assert_equal(result.to_a, [])
    assert_equal(true, different_objects)
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title('Buy milk'))
  end

  def test_all_done
    assert_equal([], @list.all_done.to_a)
  end

  def test_all_not_done
    @list.mark_done_at(1)
    assert_equal([@todo1, @todo3], @list.all_not_done.to_a)
  end

  def test_mark_done
    @list.mark_done('Buy milk')
    assert_equal(true, @todo1.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(true, @list.done?)
  end

  def test_mark_all_undone
    @list.mark_all_undone
    assert_equal(3, @list.all_not_done.size)
  end
end
