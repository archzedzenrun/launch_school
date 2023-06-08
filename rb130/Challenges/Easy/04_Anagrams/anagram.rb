=begin
*PROBLEM*

Explicit Rules:
-Select words from a given list that are anagrams of a stored value.

Implicit Rules:
-Anagrams are words whos letters can be rearranged to make a different word.
-Input wont be empty
-Anagrams are case-insensitive

-Anagram class
  -Constructor method takes 1 string argument

-match instance method(array object) -> array object

*EXAMPLES*
stored string = 'diaper'
match(%w(hello world zombies pants))

chars of stored string arent equal to the chars of any words in the
match input array. Empty array is returned.

*DATA STRUCTURE*
Array - Iteration?

*ALGORITHM*
Anagrams class constructor method
-Input: String
-Save input string as a stored word to be referenced later

match method
-Input: Array
-Select the words in the array that are anagrams and not equal to the
 stored word
-Return the array

helper method anagram?
-Input: 2 strings
-Check if the sorted chars of both strings are the same
-Return true/false
=end

class Anagram
  def initialize(word)
    @stored_word = word.downcase
  end

  def match(words_array)
    words_array.select do |word|
      anagram?(@stored_word, word) && word.downcase != @stored_word
    end
  end

  private

  def anagram?(word1, word2)
    word1.downcase.chars.sort == word2.downcase.chars.sort
  end
end
