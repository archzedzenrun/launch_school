=begin
Input: String
Output: String

Requirements:
-Write a method that takes a string as an argument.
-Return an array that contains every word from the string, to which you have appended
a space and the word length.
-Assume that words in the string are separated by exactly one space and that any substring
of non-space characters is a word.

Algorithm:
-Split the string into an array of substrings
-Iterate through the array
-Transform each substring to a string containing the substring plus a space plus the size of the substring
=end

def word_lengths(string)
  string.split.map { |substr| "#{substr} #{substr.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
