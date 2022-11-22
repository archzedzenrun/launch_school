=begin
Input: Array
Output: Integer

Requirements:
-Write a method that takes an array of numbers and returns the sum of the sums
of each leading subsequence for that array.
-Assume that the array always contains at least one number.

Examples:
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
1st iteration - 3
2nd iteration - 3 + 5 = 8
3rd iteration - 3 + 5 + 2 = 10

10 + 8 + 3 = 21

Data Structure:

Algorithm:
-Initialize a sum variable set to 0
-Iterate through the input array
-Find the sum of the current element with all elements before it, starting with the first
-Add the result to the sum variable
-Return the sum variable
=end

def sum_of_sums(nums_array)
  sum = 0
  nums_array.each_with_index do |num, index|
    sum += nums_array[0..index].sum
  end
  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
