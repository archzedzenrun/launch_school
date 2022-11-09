=begin
Input: Integer
Output: Integer

Requirements:
-Write a method that calculates and returnst hte index of the first Fibonacci
number that has the numbe ro fdigits specified as an argument. (The first fibonacci number
has index 1.)
-Assume the argument is always greater than or equal to 2

Algorithm:
-Initialize a 2 element array [1, 1]
-Until the size (number of digits) of the last element of the array is equal to the input number
-Add the last two elements of the array together
-Add the result to the end of the array
-Return the size of the array
=end

def find_fibonacci_index_by_length(number_of_digits)
  array = [1, 1]

  until array.last.digits.size >= number_of_digits
    array << (array[-1] + array[-2])
  end

  array.size
end



p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847 Too big!