=begin
# PROBLEM
  Input: String
  Output: String
  Explicit requirements:
  - Write a method that takes one argument, a string.
  - This method returns the given string with words that contain 5 or more
    characters reversed.
  - Each string will consist of only letters and spaces.
  - Spaces should be included when more than one word is present.
  Implicit requirements:
  Questions:

# EXAMPLES
  puts reverse_words('Professional')          # => lanoisseforP
  puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
  puts reverse_words('Launch School')         # => hcnuaL loohcS

# DATA STRUCTURE
  - String values will be held in an array.

# ALGORITHM
  - Split the words of the input string into an array.
  - Use transformation on the array to reverse each element that has 5 or more characters.
  - If the element has less than 5 characters, dont do anything to it.
  - Convert the array back to a string and return the string.

# CODE
=end

def reverse_words(string)
  reversed_words = string.split.map do |word|
    if word.size >= 5
      word.reverse
    else
      word
    end
  end
  reversed_words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# Revisit

def reverse_words(string)
  string.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end