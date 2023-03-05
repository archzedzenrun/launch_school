=begin
Requirements:
-Write a method that takes a string.
-Return a hash containing 3 entries: One representing the percentage of
characters in the string that are lowercase letters. One represtenting the
percentage of characters that are uppercase letters. And one representing the
percentage of characters that are neither.
-Assume the string will always contain at least one character.

Algorithm:
-Initialize a lowercase variable to an array containing all lowercase letters.
-Initialize a uppercase variable to an array containing all uppercase letters.
-Initialize a hash variable with the keys lowercase:, uppercase:, and neither: all set to values of 0.0
-Initialize 3 variables named lowercase, uppercase, and neither set to 0 - these will act as counters.
-Split the input string into an array of characters.
-Iterate over the array of characters.
-If the current character is included in the lowercase variable
-  Add 1 to the lowercase variable
-If the current character is inlcuded in the uppercase variable
-  Add 1 to the uppercase variable
-Else
-  Add 1 to the neither variable
-Set the hash key lowercase to the value of the lowercase counter divided by the size of the input string * 100
-Repeat for uppercase and neither and their equivalent counters.
-Return the hash
=end

# def letter_percentages(string)
#   hash = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }

#   lowercase_letters = ('a'..'z').to_a
#   uppercase_letters = ('A'..'Z').to_a

#   lowercase_counter = 0
#   uppercase_counter = 0
#   neither_counter = 0

#   string.chars.each do |char|
#     if lowercase_letters.include?(char)
#       lowercase_counter += 1
#     elsif uppercase_letters.include?(char)
#       uppercase_counter += 1
#     else
#       neither_counter += 1
#     end
#   end

#   hash[:lowercase] = (lowercase_counter / string.size.to_f) * 100
#   hash[:uppercase] = (uppercase_counter / string.size.to_f) * 100
#   hash[:neither] = (neither_counter / string.size.to_f) * 100


#   hash
# end

# Refactored

def letter_percentages(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    if char.match?(/[a-z]/)
      hash[:lowercase] += 1
    elsif char.match?(/[A-Z]/)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
  end

  hash.each do |key, value|
    hash[key] = (value / string.size.to_f) * 100
  end

  hash
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')
