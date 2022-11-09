=begin
Input: Array, search value
Output: Boolean

Requirements:
-Write a method that takes an array and a search value as arguments
-This method should return true if the search value is in the array, false if not
-Dont use the .include? method

Algorithm:
-Iterate over the input Array
-On each iteration, compare the current element with the search value
-If the current element equals the search value, return true, else return false.
=end

def include?(array, search_value)
  array.each { |element| return true if element == search_value }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3)          == false
p include?([nil], nil)     == true
p include?([], nil)        == false