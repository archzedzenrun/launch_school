=begin
Input: Array of strings
Output: Array of strings that are anagrams of the input

Requirements:
-Write a program that prints out groups of words that are anagrams.
-Anagrams are words that have the same exact letters in them but in a different order.

Algorithm:
-Iterate over the words variable
-Initialize an anagrams variable that will hold the words that are anagrams of the current word in the iteration
-Iterate over the words variable again
-On each iteration check if the sorted characters of the current word match the sorted characters of the word in the
outer iteration
-If it does, add the current word to the anagrams variable
-Output the anagrams variable after each outer iteration.
=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

words.each do |word1|
  anagrams = []
  words.each do |word2|
    if word1.chars.sort == word2.chars.sort
      anagrams << word2
    end
  end
  p anagrams
end
