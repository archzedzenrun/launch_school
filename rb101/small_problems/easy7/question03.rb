=begin
Input: String
Output: String

Requirements:
-Write a method that takes a single string argument
-Returns a new string that contains the original value of the argument
with the first character of every word capitalized and all other letters lowercase.
-Assume that words are any sequence of non-blank characters.

Examples:
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
                    ^ first character is ", quoted wont be capitalized.

Data Structure:
String -> Array -> String

Algorithm:
-Split the input string
-Iterate over each word
-Transform each word by capitalizing them
-Join the words back into a string
-Return the new string
=end

def word_cap(string)
  string.split.map { |word| word.capitalize }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further Exploration using upcase and swapcase

def word_cap(string)
  string.split.map { |word| word[0].upcase + word[1..-1].downcase }.join(' ')
end

def word_cap(string)
  new_string = string.downcase.split
  new_string.each { |word| word[0] = word[0].swapcase }
  new_string.join(' ')
end
