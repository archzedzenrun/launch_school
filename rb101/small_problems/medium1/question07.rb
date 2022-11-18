=begin
Input: String
Output: String

Requirements:
-Write a method that takes a sentence string as input.
-Return the same string with any sequence of the words 'zero through 'nine' converted
to a string of digits.

Algorithm:
-Initialize a numbers hash with strings representing numbers 0 through 9 as keys and
their equivalent string integers as values
-Iterate through the hash keys
-On each iteration, substitute the current hash key with the current hash key value
in the input string
-Return the mutated input string
=end

def word_to_digit(sentence)
  hash = { "zero" => '0', "one" => '1', "two" => '2', "three" => '3', "four" => '4', "five" => '5',
           "six" => '6', "seven" => '7', "eight" => '8', "nine" => '9' }

  hash.each { |key, value| sentence.gsub!(key, value) }

  sentence
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'
