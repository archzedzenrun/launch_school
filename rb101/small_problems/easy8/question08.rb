=begin
Input: String
Output: New string

Requirements:
-Write a method that takes a string
-Return a new string in which every consonant characters is doubled
-Vowels, digits, puncuation, and whitespace should not be doubled

Algorithm:
-Initialize a consonants variable containing all the consonants
-Initialize a doubled_string variable set to an empty string
-Iterate over the characters of the input string
-Check if consonants includes the downcased current character
-If it does, add the current character to the doubled_string variable twice
-If not, add the current character to the doubled_string variable
-Return the doubled_string variable
=end

def double_consonants(string)
  consonants = %w(b c d f g h j k l m n p q r s t v w x y z)
  doubled_string = ''
  string.chars.each do |char|
    if consonants.include?(char.downcase)
      doubled_string << char * 2
    else
      doubled_string << char
    end
  end
  doubled_string
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# Refactored using map

def double_consonants(string)
  consonants = %w(b c d f g h j k l m n p q r s t v w x y z)
  string.chars.map { |char| consonants.include?(char.downcase) ? char * 2 : char }.join
end
