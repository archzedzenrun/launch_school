=begin
Input: Integer
Output: Integer

Requirements:
-Write a method that returns 2 times the number provided as an argument unless the
argument is a double number; double numbers should be returned as-is.
-Double number is a number with an even number of digits whose left side digits are exactly the same
as its right side digits.

Algorithm:
-Initialize an integer_array variable set to the digits of the input integer
-Initialize a middle variable set to the size of the integer_array divided by 2
-Check if the starting index to the middle index of the integer_array is equal to
the middle index to the end index of the integer_array
-If it is, return the input integer
-If not, double the input integer and return it
=end

def twice(input_integer)
  integer_array = input_integer.digits.reverse
  middle = integer_array.size / 2
  if integer_array[0...middle] == integer_array[middle..-1]
    return input_integer
  else
    return input_integer * 2
  end
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# Refactored

def twice(integer)
  integer = integer.to_s
  middle = integer.size / 2
  integer[0...middle] == integer[middle..-1] ? integer.to_i : integer.to_i * 2
end
