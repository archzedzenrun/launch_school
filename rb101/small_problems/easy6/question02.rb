=begin
Input: Array of strings
Output: Array of strings

Requirements:
-Write a method that takes an array of strings
-Return an array of the same string values, with the vowels (aeiou) removed.

Algorithm:
-Initialize a vowels variable that points to a string containing the vowels
-Iterate over each element of the input array.
-Delete the vowels from each element
-Return the array
=end

def remove_vowels(string_array)
  vowels = 'aeiouAEIOU'
  string_array.map! { |string| string.delete(vowels) }
  string_array
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']