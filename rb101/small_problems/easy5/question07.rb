=begin
Input: String
Output: Hash

Requirements:
-Write a method that takes a string with one or more space separated words
-Return a hash that shows the numbe rof words of different sizes
-Words consist of any string of characters that do not include a space

-*Modify the method from the previous problem to exclude non-letters when determining word size.*

Data Structure:
String -> Array -> Hash

Algorithm:
-Initialize a letters variable that will hold the values we want to keep
-Split the input string into characters and keep values that are included in the letters variable.
-Join the characters back into words
-Split the words and iterate over the array of words
-Determine the size of the current word and use that as the hash key
-Check if the current key exists in the hash, if so, increment it by 1
-If it doesnt exist, set it to 1
=end

def word_sizes(string)
  letters = [' ']
  ('a'..'z').each { |letter| letters << letter }
  ('A'..'Z').each { |letter| letters << letter }

  new_string = string.chars.keep_if { |char| letters.include?(char) }.join

  new_string.split(' ').each_with_object({}) do |word, hash|
    if hash.key?(word.size)
      hash[word.size] += 1
    else
      hash[word.size] = 1
    end
  end
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}