=begin
*PROBLEM*
Input: String
Output: String

Rules:
-Change each character of the string to the 13th previous alphabetic letter.
-Wrap around to the end of the alphabet if needed

*EXAMPLES*
Nqn Ybirynpr == Ada Lovelace

*DS*
array - alphabet positions/letters

*ALGORITHM*
-Create a alpha array with a-z
-Iterate through chars of input string
  -Find alpha position of current char
  -Subtract 13
  -Replace current letter with letter at new index
-Return new string
=end

def decrypt_rot(str)
  alpha = ('a'..'z').to_a
  str.chars.map do |char|
    if alpha.include?(char.downcase)
      new_char = alpha[alpha.index(char.downcase) - 13]
      char == char.upcase ? new_char.upcase : new_char
    else
      char
    end
  end.join
end

names = ['Nqn Ybirynpr', 'Tenpr Ubccre', 'Nqryr Tbyqfgvar', 'Nyna Ghevat',
  'Puneyrf Onoontr', 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss', 'Ybvf Unvog', 'Pynhqr Funaaba', 'Fgrir Wbof',
  'Ovyy Tngrf', 'Gvz Orearef-Yrr', 'Fgrir Jbmavnx', 'Xbaenq Mhfr',
  'Fve Nagbal Ubner', 'Zneiva Zvafxl', 'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv', 'Tregehqr Oynapu']

names.each { |name| p decrypt_rot(name) }

# def decrypt(string)
#   string.tr('a-zA-Z', 'n-za-mN-ZA-M')
# end

# require 'minitest/autorun'


# class IntegerTest < MiniTest::Test

#   def setup
#     @value1 = 10
#     @value2 = 9
#     @value3 = 3
#   end

#   def test_odd?
#     assert_predicate @value2, :odd?
#   end

# end


# require 'minitest/autorun'

# class StringTest < MiniTest::Test
#   def test_downcase
#     str = "XYZ"
#     assert_equal("xyz", str.downcase)
#   end
# end

# require 'minitest/autorun'

# class NilTest < MiniTest::Test
#   def test_not_nil
#     str = nil
#     assert_nil(str)
#   end
# end

# require 'minitest/autorun'

# class ArrayTest < MiniTest::Test
#   def test_empty
#     list = []
#     assert_empty(list)
#   end
# end

# require 'minitest/autorun'

# class ArrayTest < MiniTest::Test
#   def test_empty
#     list = []
#     assert_includes(list, 'xyz')
#   end
# end


# class Employee
#   def hire
#     raise ExperienceError, 'Got no experience'
#   end
# end

# class TestExercise < Minitest::Test
#   def test_
#     employee = Employee.new
#     assert_raises(ExperienceError) { employee.hire }
#   end
# end


# require 'minitest/autorun'


# class NumericTest < MiniTest::Test
#   def setup
#     @value = Numeric.new
#   end

#   def test_
#     assert_instance_of(Numeric, @value)
#   end
# end


# require 'minitest/autorun'

# class List
#   def process
#     self
#   end
# end

# class ListTest < MiniTest::Test
#   def setup
#     @list = List.new
#     @another = Array.new
#   end

#   def test_same
#     assert_same(@another, @list.process)
#   end
# end

# require 'minitest/autorun'

# class ListTest < MiniTest::Test
#   def setup
#     @list = [1, 'xyz', 9]
#   end

#   def test_list
#     refute_includes(@list, 'xyz')
#   end
# end