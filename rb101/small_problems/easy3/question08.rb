=begin
# PROBLEM
  Input: String
  Output: Boolean
  Explicit requirements:
  - Write a method that returns true if the string passed as an argument is
    a palindrome, false otherwise.
  - Case matters as does punctuation and spaces.
  Implicit requirements:
  - A palindrome reads the same forward and backward.
  Questions:

# EXAMPLES
  palindrome?('madam') == true
  palindrome?('Madam') == false          # (case matters)
  palindrome?("madam i'm adam") == false # (all characters matter)
  palindrome?('356653') == true

# DATA STRUCTURE

# ALGORITHM
  - Define a method
  - Initialize an empty string and assign it to a variable named reverse_string
  - Starting with the last element, push each element to the reverse_string variable
  - Compare the original string input to the reverse_string variable and return
    the result
# CODE
=end
def palindrome?(string)
  reverse_string = ''
  counter = string.size - 1
  until counter == -1 do
    reverse_string << string[counter]
    counter -= 1
  end
  string == reverse_string
end

# Simplified code using .reverse method

def palindrome?(string)
  string == string.reverse
end

# Further exploration

def palindrome?(object)
  reversed_object = object.class.new
  counter = (object.size - 1)
  until counter == -1 do
    reversed_object << object[counter]
    counter -= 1
  end
  object == reversed_object
end
