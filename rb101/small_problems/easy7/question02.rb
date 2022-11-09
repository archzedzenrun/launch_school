=begin
Input: String
Output: Hash

Requirements:
-Write a method that takes a string and returns a hash that contains 3 entries:
-One representing the number of characters in the sstring that are lowercase letters.
-One representing the number of characters that are uppercase letters.
-And one representing the number of characters that are neither.

Examples:

Algorithm:
-Initialize an uppercase variable to a string containing all uppercase letters
-Initialize a lowercase variable to a string containing all lowercase letters
-Initialize a hash variable to a hash with the keys: lowercase, uppercase, and neither,
with all values set to 0.
-Split the input string into characters
-Iterate over the string characters
-If the uppercase variable includes the current character, add 1 to the value of the uppercase key in the hash
-If the lowercase variable includes the current character, add 1 to the value of the lowercase key in the hash
-If the current character is not a letter, add 1 to the value of the neither key in the hash
-Return the hash
=end

def letter_case_count(string)
  uppercase = ('A'..'Z')
  lowercase = ('a'..'z')
  hash = { lowercase: 0, uppercase: 0, neither: 0 }

  string.chars.each do |char|
    case
    when uppercase.include?(char) then hash[:uppercase] += 1
    when lowercase.include?(char) then hash[:lowercase] += 1
    else hash[:neither] += 1
    end
  end

  hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }