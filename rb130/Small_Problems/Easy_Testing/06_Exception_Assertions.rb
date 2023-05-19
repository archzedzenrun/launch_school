require 'minitest/autorun'

NoExperienceError = Class.new(StandardError)

class Employee
  def hire
    raise NoExperienceError
  end
end

class ExceptionTest < MiniTest::Test
  def test_exception
    assert_raises(NoExperienceError) { Employee.new.hire }
  end
end