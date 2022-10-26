=begin
Input: String
Output: Hash

Requirements:
-Write a method that takes a string with one or more space separated words
-Return a hash that shows the numbe rof words of different sizes
-Words consist of any string of characters that do not include a space

Data Structure:
String -> Array -> Hash

Algorithm:
-Split the input string into an array
-Iterate over the array of strings
-Determine the size of the current string and use that as the hash key
-If the current key exists in the hash, increment it by 1
-If it doesnt exist, set it to 1
=end

def word_sizes(string)
  string.split(' ').each_with_object({}) do |word, hash|
    if hash.key?(word.size)
      hash[word.size] += 1
    else
      hash[word.size] = 1
    end
  end
end

# p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

# Alternate using a new hash with a default value of 0

def word_sizes(string)
  string.split(' ').each_with_object(Hash.new(0)) do |word, hash|
    hash[word.size] += 1
  end
end
