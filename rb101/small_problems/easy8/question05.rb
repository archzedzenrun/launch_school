=begin
Input: String
Output: Array of Strings

Requirements:
-Write a method that returns a list of all substrings of a string that are palindromic.
-Each substring must consist of the same sequence of characters forwards as it does backwards.
-The return value should be arranged in the same sequence as the substrings appear in the string.
-Duplicate palindromes should be included multiple times.

Examples:
palindromes('abcd') == []
palindromes('madam') == ['madam', 'ada']
palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

DS:
String -> Array

Algorithm:
Palindrome? helper method:
-Return true/false if the string argument is equal to itself in reverse.

Using leading_substrings and substrings methods:
-Initialize a palindromes variable set to an empty array.
-Initialize a substrings variable set to the result of invoking the substrings variable on the string argument.
-Iterate through the substrings variable.
-On each iteration, add the current substring to the palindromes variable if passing the current substring to the palindrome? method returns true, and the current substring is more than 1 character.
-Return the palindromes variable.
=end

def leading_substrings(string)
  substrings = []
  (0...string.size).each { |index| substrings << string[0..index] }
  substrings
end

def substrings(string)
  substrings = []

  (0...string.size).each do |index|
    substrings += leading_substrings(string[index..-1])
  end

  substrings
end

def palindrome?(string)
  string == string.reverse
end

def palindromes(string)
  palindromes = []
  substrings = substrings(string)

  substrings.each do |substr|
    palindromes << substr if palindrome?(substr) && substr.size > 1
  end

  palindromes
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]