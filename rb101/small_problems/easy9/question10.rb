=begin
Input: Nested array
Output: Array

Requirements:
-Write a method which takes a grocery list (array) of fruits with quantities
and coverts it into an array of the correct number of each fruit.

Algorithm:
-Inialize a new_array variable set to an empty array.
-Iterate through the input array.
-On each iteration add the first element to the new_array as many times as the
second element indicates.
-Return new_array
=end

def buy_fruit(array)
  array.each_with_object([]) do |subarr, new_array|
    subarr[1].times { new_array << subarr[0] }
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
