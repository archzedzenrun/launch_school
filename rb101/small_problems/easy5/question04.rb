=begin
Input: String
Output: String with the first and last letters of every word swapped

Requirements:
-Given a string of words separated by sapces,
-Write a method that returns a string in which the first and last letters of every word are swapped
-Assume that every word contains at least one letter and the string will always contain at least one word.
-Assume each string contains nothing but words and spaces.

Data structure:

Algorithm:
-Split the string into an array of strings
-Iterate over the array of strings for transformation
-Store the letter at the first index in a variable
-Set the first index to the value of the last index
-Set the last index to the value of the first index variable
-Join the array back into a string
-Return the result
=end

def swap(string)
  string.split(' ').map do |word|
    first_letter = word[0]
    word[0] = word[-1]
    word[-1] = first_letter
    word
  end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
