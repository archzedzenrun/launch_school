=begin
Sum of Pairs

Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

sum_pairs([11, 3, 7, 5],         10)
#              ^--^      3 + 7 = 10
== [3, 7]

sum_pairs([4, 3, 2, 3, 4],         6)
#          ^-----^         4 + 2 = 6, indices: 0, 2 *
#             ^-----^      3 + 3 = 6, indices: 1, 3
#                ^-----^   2 + 4 = 6, indices: 2, 4
#  * the correct answer is the pair whose second value has the smallest index
== [4, 2]

sum_pairs([0, 0, -2, 3], 2)
#  there are no pairs of values that can be added to produce 2.
== None/nil/undefined (Based on the language)

sum_pairs([10, 5, 2, 3, 7, 5],         10)
#              ^-----------^   5 + 5 = 10, indices: 1, 5
#                    ^--^      3 + 7 = 10, indices: 3, 4 *
#  * the correct answer is the pair whose second value has the smallest index
== [3, 7]

*PROBLEM*
Explicit Rules:
-INPUT: Array of integers
        Integer representing sum target
-Return the first 2 numbers from left to right that equal the Integer argument (added together)
-If there is more than 1 pair of numbers that equal the sum:
  -Return the pair whose second element has the smallest index.

Implicit Rules:
-Return nil if there are no pairs that equal the sum
-Pair means 2 different numbers (a number cant be added to itself to equal the sum)

*DATA STRUCTURE*
Array
Hash to store pairs and indexes?

*ALGORITHM*
-Initialize a pairs hash
1. Find all pairs of numbers that equal the sum.
  -Iterate over the input array
    -On each iteration iterate through the rest of the numbers
    -Check if current num plus num in second iteration is equal to sum
    -If it is, add the nums to pairs hash as key, and their indexes as values
-Sort the pairs hash by the second index value
-Return the key (pair) with the lowest value
=end

def sum_pairs(nums_arr, sum)
  pairs = {}

  nums_arr.each_with_index do |num1, num1_idx|
    (num1_idx + 1...nums_arr.size).each do |num2_idx|
      num2 = nums_arr[num2_idx]
      if num1 + num2 == sum
        pairs[[num1, num2]] = [num1_idx, num2_idx]
      end
    end
  end

  return nil if pairs.empty?
  sorted_hash = pairs.min_by{ |k, v| v[1] }[0]
end

l1= [1, 4, 8, 7, 3, 15]
l2= [1, -2, 3, 0, -6, 1]
l3= [20, -13, 40]
l4= [1, 2, 3, 4, 1, 0]
l5= [10, 5, 2, 3, 7, 5]
l6= [4, -2, 3, 3, 4]
l7= [0, 2, 0]
l8= [5, 9, 13, -3]

#p sum_pairs(l1, 8) #== [1, 7]
#p sum_pairs(l2, -6) == [0, -6]
#p sum_pairs(l3, -7) == nil
p sum_pairs(l4, 2) #== [1, 1]
p sum_pairs(l5, 10) #== [3, 7]
# p sum_pairs(l6, 8) == [4, 4]
# p sum_pairs(l7, 0) == [0, 0]
# p sum_pairs(l8, 10) == [13, -3]

=begin TIME TAKEN: 5 MINUTES
Write a method that takes a string, and returns a new string in which every character is doubled.

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd jjoobb!!"
p repeater('') == ''

*PROBLEM*
Explcit Rules:
-INPUT: String
-Return a new string with every char doubled
-OUTPUT: String

Implicit Rules:
-Spaces dont count as a char

Questions:
-Return a new string object or modified original?

*DS*
Array (iteration)

*ALGORITHM*
-Intialize new string vari to an empty string
-Iterate over chars of input string
  -On each iteration add 2 of the current char to the new string vari
-Return new string
=end
def repeater(str)
  new_str = ''
  str.chars.each do |char|
    if char == ' '
      new_str << char
    else
      2.times { new_str << char }
    end
  end
  new_str#.squeeze(' ')
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") #== "GGoooodd jjoobb!!"
p repeater('') == ''

=begin TIME TAKEN: 7 MINUTES
Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

*PROBLEM*
Explicit Rules:
-INPUT: String
-Double every consonant character
-All other characters should not be doubled (including punctuation)
-OUTPUT: String

Implicit Rules:

Questions:
-Same string object or new string object?

*EXAMPLES*
double_consonants('String') == "SSttrrinngg"
consonants = s, t, r, n, g

double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

*DS*
Array

*ALGORITHM*
Helper method:
-Return true or false if input str is a consonant
  -Intitialize a consontants array to hold consonants
  -Check if input str is inlcuded in the consonants array.
-Return true/false

Main method:
-Initialize new_str vari to empty string.
-Split input str into an array of chars
-Iterate over array of chars
  -If char is a consonant, add it twice to new_str
  -Else only add it once
-Return new_str
=end

def consonant?(char)
  consonants = ('a'..'z').to_a - 'aeiou'.chars
  consonants.include?(char.downcase)
end

def double_consonants(str)
  new_str = ''

  str.chars.each do |char|
    if consonant?(char)
      2.times { new_str << char }
    else
      new_str << char
    end
  end

  new_str
end

p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

=begin TIME TAKEN: 23 MINS
How can you tell an extrovert from an introvert at NSA? Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.

I found this joke on USENET, but the punchline is scrambled. Maybe you can decipher it? According to Wikipedia, ROT13 is frequently used to obfuscate jokes on USENET.

Hint: For this task you're only supposed to substitue characters. Not spaces, punctuation, numbers etc.

rot13("EBG13 rknzcyr.") == "ROT13 example."; rot13("This is my first ROT13 excercise!" == "Guvf vf zl svefg EBG13 rkprepvfr!"

Rot 13 means each letter is replaced by the letter appearing 13 places in the alphabt. after the original letter. Last 13 letters alphabet you start over.

Test examples:

rot13("EBG13 rknzcyr.") == "ROT13 example."
rot13("This is my first ROT13 excercise!" == "Guvf vf zl svefg EBG13 rkprepvfr!"

*PROBLEM*
INPUT: String
OUTPUT: String

Explicit Rules:
-Transform each letter into the letter 13 places after it in the alphabet.
-If you go past z, start from a

Implicit Rules:
-Char case should stay the same.

Questions:
-Return new str object or original?

*DS*
Hash to hold alphabet positions
Array

*ALGORITHM*
1. Replace each alphabetic char with the char at current position plus 13

IS_UPCASE? Helper method
-Input: String
-Check if string is equal to itself uppercase
-Output: Boolean

SWAP_CHAR Helper method
-Input: String
-Create an alpha hash with 1-26 as keys and a-z as values
-Find the position of input char downcased in the hash
-Add 13 to get the new position
-If that num is greater than 26, decrement new position by 26
-Check if input string was uppercase using helper method
-If it was return the upcased char at the new position
-Else return the char at new position

MAIN METHOD:
  -Split input str into array of chars
  -Iterate over array of characters
    -If current char is a-z
      -Swap the current char using helper method
    -Else leave the current char as is
  -Return the new string
=end

# def is_upcase?(char)
#   char == char.upcase
# end

# def swap_char(char)
#   positions = (1..26).zip('a'..'z').to_h
#   new_position = positions.key(char.downcase) + 13
#   new_position -= 26 if new_position > 26
#   new_char = positions[new_position]
#   is_upcase?(char) ? new_char.upcase : new_char
# end

# def rot13(str)
#   str.chars.map { |char| ('a'..'z').include?(char.downcase) ? swap_char(char) : char }.join
# end

ALPHA = ('a'..'z').to_a

def is_upcase?(char)
  char == char.upcase
end

def swap_char(char)
  new_position = (ALPHA.index(char.downcase) + 13)
  new_position -= 26 if new_position >= 26
  new_char = ALPHA[new_position]
  is_upcase?(char) ? new_char.upcase : new_char
end

def rot13(str)
  str.chars.map { |char| ALPHA.include?(char.downcase) ? swap_char(char) : char }.join
end


p rot13("Abc") #== "Nop"
 p rot13("xYz") == "kLm"
 p rot13("EBG13 rknzcyr.") #== "ROT13 example."
 p rot13("This is my first ROT13 excercise!") == "Guvf vf zl svefg EBG13 rkprepvfr!"

=begin TIME TAKEN 12 MINS
Find the length of the longest substring in the given string that is the same in reverse.

Example:
longest_palindrome("I like racecars that go fast") == 7

If the length of the input string is 0, return value must be 0

p longest_palindrome('') == 0
p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baab1kj12345432133d') == 9
p longest_palindrome("I like racecars that go fast") == 7
p longest_palindrome("aa aa") == 5
p longest_palindrome('abcde') == 1

*PROBLEM*
Input: String
Output: Integer

Explicit Rules:
-Find the longest substring that is a palindrome
-Return 0 if input string is empty

Implicit Rules:
-

Questions:
-Will there be uppercase letters?
-Are palindromes case sensitive?

*DS*
Array to hold all substrings

*ALGORITHM*
Helper method all_substrings:
Input: String
Init substrings variable to empty array
Iterate from 0 up to (not including) input size (start)
  -Iterate from start up to (not including) input size (end)
  -Add input str at index range start to end to substrings array
Return substrings array
Output: Array

Helper method palindrome?:
Input: String
Check if string is equal to itself backwards
Output: Boolean (true/false)

Main method:
Init substrings variable to all_substrings(input)
Init palindromes variable to empty array
Iterate over substrings variable
  -If current substring is palindrome?
    -Add it to palindromes array
Return the size of the longest palindrome



=end

def palindrome?(str)
  str == str.reverse
end

def all_substrings(str)
  substrings = []
  (0...str.size).each do |st_idx|
    (st_idx...str.size).each do |end_idx|
      substrings << str[st_idx..end_idx]
    end
  end
  substrings
end

def longest_palindrome(str)
  return 0 if str.empty?
  substrings = all_substrings(str)
  substrings.select! do |substr|
    palindrome?(substr)
  end
  substrings.map(&:size).max
end

p longest_palindrome('') == 0
p longest_palindrome('a') #== 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baab1kj12345432133d') == 9
p longest_palindrome("I like racecars that go fast") == 7
p longest_palindrome("aa aa") == 5
p longest_palindrome('abcde') == 1


=begin TIME TAKEN 8 MINUTES
Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere you want.

Legend: -Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".

-Function input: String contains only letters, uppercase letters are unique.

Task: Place all people in alphabetical order where Mothers are followed by their children,
i.e. "aAbaBb" => "AaaBbb".

*PROBLEM*
Input: String
Output: String

Explicit Rules:
-Input will only be letters
-Unique uppercase letters
-Sort chars alphabetically
-Upcase chars should come before lowercase

*DS*
Array - Iteration

*ALGORITHM*
-Init sorted_str variable to empty string
-Iterate over a through z
  -Add the count of each UPCASED letter in the input str to sorted_str
  -Add the count of each LOWERCASE letter in the input str to sort_str
-Return sorted_str
=end

def find_children(str)
  ('a'..'z').each_with_object('') do |letter, sorted_str|
    sorted_str << letter.upcase * str.count(letter.upcase)
    sorted_str << letter * str.count(letter)
  end
end

p find_children("abBA") #== "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""

=begin TIME TAKEN 7:40 MINUTES
W
rite a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

Examples:

double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

*PROBLEM*
Input: String
Output: String

Explicit Rules:
-Double every char that is a consonant
-Dont double any other letters/digits/punctuation

Implicit Rules:
-Empty str returns empty str

Questions:
-Same string object or new string object?

*DS*
Array - iteration

*ALGORITHM*
Helper method for consonants:
-Input: Str
Determine if input is a consonant
-Output: Boolean (true/false)

-Split input str into array of chars
-Iterate over array of chars
  -If char is a consonant?
    -Double it (concatenate it with itself)
  -Else leave it as is
-Return modified string
=end

def consonant?(str)
  consonants = ('a'..'z').to_a - 'aeiou'.chars
  consonants.include?(str.downcase)
end

def double_consonants(str)
  str.chars.map { |char| consonant?(char.downcase) ? char + char : char }.join
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

=begin TIME TAKEN 5:20 MINUATES
Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. For similar reasons, the return value for our fourth example doesn't have any leading zeros.

*PROBLEM*
Input: Integer
Output: Integer (reversed input)

Explicit Rules:
-Return input integer with its digits reversed
-No leading 0's

Implicit Rules:
-Integers only, no floats

*DS*
Array - iteration and to hold new num

*ALGORITHM*
-Init new num array
-Split input into an array of integers
-Iterate over integers
  -Push each integer to the beginning of new num array
-Return new num array as an integer
=end

def reversed_number(num)
  new_num = []
  num.to_s.chars.each { |n| new_num.unshift(n) }
  new_num.join.to_i
end

p reversed_number(12345) #== 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1


=begin TIME TAKEN 6:30 MINS

Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

Examples:

Copy Code center_of('I love ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'

*PROBLEM*
Input: String
Output: String

Explicit Rules:
-Return the middle char/chars of the input str
-Return one (middle) char if str length is odd
-Return two chars if str length is even

Implicit Rules:
-Input wont be empty
-Spaces are considered chars
-Return is str itself if length is 2 or less

*EXAMPLES*
Launch - size 6
6/2 = 3
index 3 = n
previous index = 2
index 2 = u
u + n are center

Lunch - size 5
5 / 2 = 2
index 2 = n

*DS*
Array - iteration

*ALGORITHM*
-Find the length of the input str divided by 2
-If the input str length is odd, return the char at that index
-Else return the char at the previous index plus the char at that index
=end

def center_of(str)
  center_idx = str.size / 2
  str.size.odd? ? str[center_idx] : str[center_idx-1..center_idx]
end

p center_of('I love ruby') #== 'e'
p center_of('Launch School') #== ' '
p center_of('Launch') #== 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'


=begin
*PROBLEM*
Input: Array
Output: Array (rotated)

Explicit Rules:
-Rotate the first element to the end of the Array
-Dont modify the original object (create a new one)
-Dont use rotate methods

*DS*
Array

*ALGORITHM*
-Create a new array object
-Remove the first element from the input
-Add it to the end of the new array
-Return the new array

*ALGORITHM*
max_rotation(735291) == 321579
move index 0 to end (7) -> 352917

move index 1 to end (5) -> 329175
move index 2 to end (9) -> 321759
move index 3 to end (7) -> 321597
move index 4 to end (9) -> 321579
=end

def rotate_array(arr)
  arr = arr.dup
  arr << arr.shift
end

def rotate_rightmost_digits(num, rotations=0)
  num_arr = num.digits.reverse
  rotated = rotate_array(num_arr[-rotations..-1])
  (num_arr[0...-rotations] + rotated).join.to_i
end

def max_rotation(num)
  counter = num.digits.size
  new_arr = num
  until counter == 1
    new_arr = rotate_rightmost_digits(new_arr, counter)
    counter -= 1
  end
  new_arr
end
p max_rotation(735291)
# p rotate_rightmost_digits(735291, 1) #== 735291
# p rotate_rightmost_digits(735291, 2) #== 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]


=begin
*EXAMPLE*
n = 5
[off, off, off, off, off]
[on, on, on, on ,on ,on] - 1
[on, off, on, off, on] - every 2nd switch hit
[on, off, off, off, on] - every 3rd switch hit
[on, off, off, on, on] - every 4th switch hit
[on, off, off, on ,off] - every 5th switch hit

1 and 4 are left on (index 0 and 3)
[1, 4]

*ALGO*

=end

def on_lights(num)
  arr = []

  (1..num).each do |n1|
    (1..num).each do |n2|
      arr[n2 - 1] = !arr[n2 - 1] if n2 % n1 == 0
    end
  end

  arr.each_with_index.with_object([]) do |(switch, idx), result|
    result << idx + 1 if switch
  end
end

p on_lights(1000)

# def on_lights(num)
#   arr = []

#   (1..num).each do |n|
#     (1..num).each_with_index do |n2, idx|
#       arr[idx] = !arr[idx] if n2 % n == 0
#     end
#   end

#   arr.each_with_index.with_object([]) do |(switch, idx), result|
#     result << idx + 1 if switch
#   end
# end

# p on_lights(5)

=begin
You have to create a method that takes a positive integer number and returns the next bigger number formed by the same digits:
If no bigger number can be composed using those digits, return -1:

*PROBLEM*
Input: Integer
Output: Integer

Explicit Rules:
-Return the next larger number formed by the same digits
-Return -1 if there are none
-Input will be positive integer

*DS*
Array - iteration



=end

def next_bigger_num(num)
  digits = num.digits.reverse
  nums = []
  digits.permutation { |p| nums << p.join.to_i }
  #nums.sort!
  nums.last == num ? -1 : nums[nums.index(num) + 1]
end

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) #== -1
p next_bigger_num(531)# == -1
p next_bigger_num(123456789) == 123456798


=begin TIME TAKEN 7:00
Count letters in string In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

*PROBLEM*
Input: String
Output: Hash

Explicit Rules:
-letters will be lowercase
-letter will be a hash key
-hash keys will be symbols
-letter count will be the hash value

Implicit Rules:
-no spaces
-a-z only (no punctuation)

*DS*
Array - Iteration
Hash - Letters/counts

*ALGORITHM*
-Create an empty hash
-Iterate through chars of input str
  -Set the hash key as current char
  -And the value as the count of char in input str
-Return the hash
=end

def letter_count(str)
  hash = {}
  str.chars.each do |char|
    hash[char.to_sym] = str.count(char)
  end
  hash
end

p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}


=begin TIME TAKEN 10:00

You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once.
E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

Examples [1, 2, 5, 6, 5, 2] --> 2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2] --> 4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

*PROBLEM*
Input: Array
Output: Integer

Explicit Rules:
-Array will contain positive integers
-Return the count of pairs of numbers
-Input may be empty or contain 1 value - return 0
-Count only unique pairs

*DS*
Array to hold counts

*AGLORITHM*
-Init a counts variable to empty arr
-Init a pairs variable to 0
-Iterate through the digits of input array
  -Add the count of current num in input array to the counts arr
-Iterate over the counts arr
  -Divide the current num by 2
  -Add the num to the pairs
-Return pairs
=end

def pairs(arr)

  pairs = 0

  arr.uniq.each { |num| pairs += arr.count(num) / 2 }
  pairs
end

p pairs([1, 2, 5, 6, 5, 2]) #== 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) #== 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

=begin
Complete the solution so that it returns the number of times the search_text is found within the full_text.


p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') == 1

*PROBLEM*
Input: 2 Strings
Output: Integer

Explicit Rules:
-Count how many times the second str argument appears in the first string argument

Implicit Rules:
-Inputs will be a-z
-Lowercase
-Neither will be empty

*DS*

*ALGORITHM*
-Return count of how many times second arg appears in first arg
=end

def solution(str1, str2)
  substrings = []
  (0...str1.size).each do |st|
    (st...str1.size).each do |nd|
      substrings << str1[st..nd]
    end
  end
  substrings.count(str2)
end

p solution('abcdeb','b') == 2
p solution('abcdeb', 'a') == 1
p solution('abbc', 'bb') #== 1


=begin

Alphabet symmetry Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1] See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

*PROBLEM*
Input Array of strings
Output: Array of integers

Explicit Rules:
-Count the number of letters in each word that have the correct alphabet position in the string
-Strings will be only a-z
-Uppercase and lowercase
-No spaces

Implicit Rules:
-Array wont have less than 3 strings

*DS*
Hash for alphabet positions
Array for iteration / results

*ALGORITHM*
Helper method alpha_position?
-Input: String, Integer
-Init alpha positions hash to a-z 1-26
-Return true if string key value equals integer arg
-Else false

-Iterate over the input arr of words
  -Iterate over the chars of each word
    -Check if each char is in the correct alpha position
-Return result array

=end

def alpha_position?(letter, position)
  alpha_positions = ('a'..'z').zip(1..26).to_h
  alpha_positions[letter.downcase] == position + 1
end

def solve(arr)
  arr.map do |word|
    word.chars.map.with_index do |char, idx|
      alpha_position?(char, idx)
    end.count(true)
  end
end

p solve(["abode","ABc","xyzD"]) #== [4,3,1]
p solve(["abide","ABc","xyz"]) == [4,3,0]
p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"])== [6,5,7]
p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]


=begin
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

Example
For n = 152, the output should be 52;

For n = 1001, the output should be 101.


Constraints: 10 ≤ n ≤ 1000000.


*PROBLEM*
Input: Integer
Output: Integer

Explicit Rules:
-

*DS*
Array

*ALGORITHM*
-Init num_array to empty array
-Iterate through digits of input
  -On each iteration add all other numbers joined together as an integer to nuM-array
-Return the largets number in num_array
=end

def delete_digit(num)
  num_array = []
  digits = num.digits.reverse
  digits.each_with_index do |n, idx|
    num_array << (digits[0...idx] + digits[idx + 1..-1]).join.to_i
  end
  num_array.max
end

p delete_digit(152) #== 52
p delete_digit(1001) == 101
p delete_digit(10) == 1

=begin TIME TAKEN 13:00
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

*PROBLEM*
Input: String
Output: Integer

Explicit Rules:
-Find the longest vowel-only substring.
-Input will have lowercase alpha chars only (no spaces or punctuation)
-Vowels are aeiou

Implicit Rules:
-Input wont be empty

*EXAMPLES*
p solve("iiihoovaeaaaoougjyaw")
aeaaaoou - size 8

*DATA STRUCTURE*
Array - to hold substrings

*ALGORITHM*
Helper method all_vowels?
-Input: String
-Check if all chars of input str are vowels
-Return true/false
-Output: Boolean

Helper method vowel_substrings
-Input: String
-Init substrings variable to empty array
-Iterate from 0 up to not including input size (start)
  -Iterate from start up to not including input size (end)
    -Current substring is input str at index range of start to end
    -Add current substring to substrings variable if all_vowels?
-Output: Array

Main method
-Input: String
-Get all vowel substrings from vowel_substrings helper method
-Return the size of the largest vowel substring
-Output: Integer
=end

# def all_vowels?(str)
#   vowels = 'aeiou'
#   str.chars.all? { |char| vowels.include?(char) }
# end

# def vowel_substrings(str)
#   vowel_substrings = []

#   (0...str.size).each do |st_idx|
#     (st_idx...str.size).each do |end_idx|
#       current_substr = str[st_idx..end_idx]
#       vowel_substrings << current_substr if all_vowels?(current_substr)
#     end
#   end

#   vowel_substrings
# end

# def solve(str)
#   vowel_substrings = vowel_substrings(str)
#   vowel_substrings.map(&:size).max
# end

def solve(str)
  non_vowels = ('a'..'z').to_a - 'aeiou'.chars
  non_vowels.each { |consonant| str.gsub!(consonant, ' ') }
  str.split.map(&:size).max
end

p solve("codewarriors") #== 2
p solve("suoidea") == 3
p solve("iuuvgheaae") == 4
p solve("ultrarevolutionariees") == 3
p solve("strengthlessnesses") == 1
p solve("cuboideonavicuare") == 2
p solve("chrononhotonthuooaos") == 5
p solve("iiihoovaeaaaoougjyaw") == 8

=begin TIME TAKEN 11:00
Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples. =end p solve("1341") == 7
p solve("1357") == 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28

*PROBLEM*
Input: String
Output: Integer

Explicit Rules:
-Find the number of odd integer substrings

Implicit Rules:
-Input str wont be empty
-Input str will contain 0-9

*DATA STRUCTURE*
Array to hold substrings

*ALGORITHM*
Helper method odd_substrings:
-Input: String
-Init odd_substrings variable to empty array
-Iterate from 0 up to, not including, size of input (start idx)
  -Iterate from start idx up to, not including, size of input (end idx)
    -Current substr is input str at index range start idx to end idx
    -Convert current substr to integer and check if its an odd number
    -If it is, add it to odd_substrings
-Return odd_substrings
-Output: Array

Main method:
-Input: String
-Get all odd substrings from odd_substrings method
-Return the count of odd substrings
-Output: Integer
=end

def odd_substrings(str)
  odd_substrings = []

  (0...str.size).each do |st_idx|
    (st_idx...str.size).each do |end_idx|
      current_substr = str[st_idx..end_idx].to_i
      odd_substrings << current_substr if current_substr.odd?
    end
  end

  odd_substrings
end

def solve(num)
  odd_substrings = odd_substrings(num)
  odd_substrings.size
end

p solve("1357") #== 10
p solve("13471") == 12
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28


=begin TIME TAKEN 10:20
Complete the function that takes an array of words.

You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the word in the list.

For example:

["yoda", "best", "has"] --> "yes"
^ ^ ^
n=0 n=1 n=2

Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.

p nth_char(['yoda', 'best', 'has']) == 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'

*PROBLEM*
Input: Array
Output: String

Explicit Rules:
-Create a new word with the nth letter from each word of the input.
-Nth letter is the index of the word in the input.

Implicit Rules:
-Strings in array may contain punctuations or numbers, upper and lowercase a-z
-Input array may be empty -> return empty string
-Chars keep their original case

*EXAMPLES*
p nth_char(['yoda', 'best', 'has']) == 'yes'
index of yoda -> 0   0 index of yoda -> y
index of best -> 1   1 index of best -> e
index of has  -> 2   2 index of has  -> s

*DATA STRUCTURE*
Array

*ALGORITHM*
-Iterate through words and indexes of input array
-Find the char at the current index in the current word
-Return new string
=end

def nth_char(arr)
  arr.map.with_index { |word, idx| word[idx] }.join
end

p nth_char(['yoda', 'best', 'has']) #== 'yes'
p nth_char([]) == ''
p nth_char(['X-ray']) == 'X'
p nth_char(['No', 'No']) == 'No'
p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) == 'Codewars'


=begin TIME TAKEN 8:40
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times. The input string consists of lowercase latin letters. Your function should return a tuple (in Python) (t, k) or an array (in Ruby and JavaScript) [t, k]

Example #1:

for string s = "ababab" the answer is ["ab", 3]

Example #2:

for string s = "abcde" the answer is "abcde" because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

*PROBLEM*
Input: String
Output: Array [string, integer]

Explicit Rules:
-Find the smallest substring and how many times it needs to be repeated to equal the input string.
-Input will not be empty
-Input will only contain lowercase a-z

Implicit Rules:

*DATA STRUCTURE*
Array

*ALGORITHM*
-Init substring variable to empty string
-Split the input str into an array of chars
-Iterate through array of chars
  -Add current char to substring
  -Init a multiplier variable to size of input / size of substring variable
  -Check if substring variable * multiplier is equal to the input str
  -If it is, return [substring, multiplier]
=end

def f(str)
  substring = ''
  str.each_char do |char|
    substring << char
    multiplier = str.size / substring.size
    return [substring, multiplier] if substring * multiplier == str
  end
end

p f("ababab") == ["ab", 3]
p f("abcde") == ["abcde", 1]

=begin TIME TAKEN 24:00
*PROBLEM*
Input: String
Output: String

Explicit Rules:
-For each word:
  -Sort the chars between the first and last alphabetically
  -Punctuation and first/last chars should stay in their original spots
-Words are separated only by spaces
-Special characters dont count as first or last char

Implicit Rules:
-Empty str input returns empty str
-Alphabetic chars will be lowercase
-Words will only contain a-z - ' , .

*DATA STRUCTURE*
Array - iteration/sorting
Hash - storing punctuation

*ALGORITHM*

-Split the input str at spaces into an array of words
-Iterate through array of words
  -Init a punctuations variable to empty hash
  -Init a alpha variable to empty array

  -Iterate through the chars and index of current word
    -If char is not a-z, add it to punctuations hash, idx as key, char as value
    -Else add char to alpha array

  -Sort alpha array between first and last chars
  -Iterate through punctuations hash
    -Insert punctuation at idx in the alpha variable

  -Join alpha variable into a string
-Join split words back into a string and return it
=end

def scrambled(str)
  return str if str.size <= 3
  punctuations = {}
  alpha_chars = []

  str.each_char.with_index do |char, idx|
    ('a'..'z').include?(char) ? alpha_chars << char : punctuations[idx] = char
  end

  new_word = alpha_chars[0] + alpha_chars[1..-2].sort.join + alpha_chars[-1]
  punctuations.each { |idx, char| new_word.insert(idx, char) }

  new_word
end

def scramble_words(str)
  str.split.map { |word| scrambled(word) }.join(' ')
end

 p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('i') #== 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramble_words('-dcba') == '-dbca'
p scramble_words('dcba.') == 'dbca.'
p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

=begin TIME TAKEN 25:00
*PROBLEM*
Input: String
Output: Array

Explicit Rules:
-Find the top 3 words that occur most often
  -Words should be returned in descending order (most, 2nd most, 3rd most)
-Input may contain punctuation
-A word contains chars a-z and/or apostrophies
-Matches should be case insensitive (upper and lowercase are the same)
-Strings in result should be lowercase
-If there are fewer than 3 words in the input, return the top 2 or 1 words
-Return empty array if input is empty

Implicit Rules:
-Apostrophes are the only valid punctuation, others should be ignored
-Strings may contain uppercase a-z, treat as downcased

*DATA STRUCTURE*
Array - iteration
Hash - word counts

*ALGORITHM*
Helper method delete_punctuation(String) -> String
-Init clean_str variable to empty str
-Iterate through chars of input str
  -Add char to clean_str if its a-z or apostrphe
-Return clean_str

Main method(str) -> array
-Init word_count variable to a new hash
-Split input str into array of words
-Iterate through words array
  -Increment the count of current word by 1 in word_count hash after delete_punct(word)
-Sort word_count by value
-Return up to the first 3 keys in an array
=end

def delete_punct(str)
  valid_chars = ('a'..'z').to_a + ["'"]
  clean_str = ''
  str.each_char { |char| clean_str << char if valid_chars.include?(char) }
  clean_str
end

def top_3_words(str)
  word_count = Hash.new(0)

  str.split.each do |word|
    clean_word = delete_punct(word.downcase)
    next if clean_word.empty? || clean_word[0] == "'"
    word_count[clean_word] += 1
  end

  sorted = word_count.sort_by { |_, count| -count }.to_h
  result = sorted.keys.first(3)
end

p top_3_words("a a a b c c d d d d e e e e e") == ["e", "d", "a"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words(" //wont won't won't ") == ["won't", "wont"]
p top_3_words(" , e .. ") == ["e"]
p top_3_words(" ... ") == []
p top_3_words(" ' ") == []
p top_3_words(" ''' ") == []
p top_3_words("""In a village of La Mancha, the name of which I have no desire to call to mind, there lived not long since one of those gentlemen that keep a lance in the lance-rack, an old buckler, a lean hack, and a greyhound for coursing. An olla of rather more beef than mutton, a salad on most nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra on Sundays, made away with three-quarters of his income.""") == ["a", "of", "on"]


=begin TIME TAKEN 15:00
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

For example, the score of abad is 8 (1 + 2 + 1 + 4).

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

*PROBLEM*
Input: String
Output: String

Explicit Rules:
-Find the highest scoring word:
  -Word score is based on the sum of each letters alphabet position
-If two or more words have the same score, return the one that appears first
-All chars will be lowercase

Implicit Rules:
-Input str wont be empty
-Input str will only contain lowercase a-z
-Words are separated by spaces

*EXAMPLES*
abad is 8 (1 + 2 + 1 + 4)

*DATA STRUCTURE*
Hash for alphabet chars and positions
Array - iteration

*ALGORITHM*
-Split input string into an array of words
-Iterate over words array
  -Iterate over chars of current word
    -Find value of current char in alphabet hash
  -Find the sum of values of current word
-Find the index of the highest value
-Find the word in the input at that index
-Return the word
=end

def char_score(str)
  positions = ('a'..'z').zip(1..26).to_h
  positions[str]
end

def high(str)

  word_scores = str.split.map do |word|
                  word.chars.map do |char|
                    char_score(char)
                  end.sum
                end
  largest_word = word_scores.max
  str.split[word_scores.index(largest_word)]
end

p high('man i need a taxi up to ubud') #== 'taxi'
p high('what time are we climbing up the volcano') == 'volcano'
p high('take me to semynak')==  'semynak'
p high('aa b') ==  'aa'
p high('b aa') == 'b'
p high('bb d') == 'bb'
p high('d bb') == 'd'
p high('aaa b') == 'aaa'


=begin
You are given a secret message you need to decipher. Here are the things you need to know to decipher it:

For each word:

the second and the last letter is switched (e.g. Hello becomes Holle)
the first letter is replaced by its character code (e.g. H becomes 72)
Note: there are no special characters used, only letters and spaces

Examples
decipherThis('72olle 103doo 100ya'); // 'Hello good day'
decipherThis('82yade 115te 103o'); // 'Ready set go'

*PROBLEM*
Input: String
Output: String

Explicit Rules:
-The second and last letters are switched for each word
-Replace first letter with its character code
-Input will only contain letters and spaces

Implicit Rules:
-Words are separated by spaces
-Letters may be upper or lowercase
-Input string wont be empty

*DATA STRUCTURE*
Array

*ALGORITHM*
-Init new_str to empty array
-Split input str into array of words
-Iterate over words array

  -Iterate over chars and indexes of current word
  -If char is 0-9 add it to nums
  -Else add it to letters

  -Find the character of the nums variable
  -Insert num character at beginning of letters

  -Swap second and last chars of letters variable
  -Add word to new_str
=end

def decipher_this(str)
  new_str = []

  str.split.each do |word|
    nums = []
    letters = []

    word.each_char do |char|
      ('a'..'z').include?(char) ? letters << char : nums << char
    end

    letters.unshift(nums.join.to_i.chr)
    if letters.size == 1
      new_str << letters.join
      next
    end

    letters[1], letters[-1] = letters[-1], letters[1]
    new_str << letters.join
  end
  new_str.join(' ')
end
#REFACTORED
def decipher_word(str)
  nums = []
  letters = []

  str.each_char { |char| ('a'..'z').include?(char) ? letters << char : nums << char }

  letters.unshift(nums.join.to_i.chr)
  letters[1], letters[-1] = letters[-1], letters[1] if letters.size > 1
  letters.join
end

def decipher_this(str)
  str.split.each_with_object([]) do |word, new_str|
    new_str << decipher_word(word)
  end.join(' ')
end
# test cases

p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") #== "A wise old owl lived in an oak"
 p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp")== "The more he saw the less he spoke"
 p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"
 p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"
 p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

=begin
Write a method that takes a string as an argument and groups the number of time each character appears in the string as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}

You should ignore spaces, special characters and count uppercase letters as lowercase ones.

*PROBLEM*
Input: String
Output: Hash

Explicit Rules:
-Find how many times each char appears in the input
-Return a hash sorted by occurrences most to least
-Letters in hash value array should be sorted alphabetically
-Ignore all chars besides a-z
-Treat upper and lowercase the same

Implicit Rules:
-Input wont be empty

*DATA STRUCTURE*
Array - iteration
Hash - lettter counts

*ALGORITHM*
-Init counts variable to hash
-Split input str into array of chars
-Iterate through array of chars
  -Check if current char is a-z
  -If it is, add the input count of current char to the counts hash as a key
    -If key already exists, add char to the key value array

=end

def valid_char?(str)
  valid = ('a'..'z').to_a + ('0'..'9').to_a
  valid.include?(str)
end

def get_char_count(str)
  counts = {}
  str.downcase.chars.uniq.sort.each do |char|
    char_count = str.downcase.count(char)
    if valid_char?(char)
      if counts.keys.include?(char_count)
        counts[char_count] << char
      else
        counts[char_count] = [char]
      end
    end
  end
  counts.sort_by { |k, _| -k }.to_h
end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}


=begin
Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil or empty array if empty), example:

pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}
Write method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.

find_suspects(pockets, [1, 2]) # => [:tom, :jane]
find_suspects(pockets, [1, 7, 5, 2]) # => nil
find_suspects(pockets, []) # => [:bob, :tom, :jane]
find_suspects(pockets, [7]) # => [:bob, :tom]

*PROBLEM*
Input: Hash - Keys are persons, values are array of numbers that represent items they are carrying
       Array - Numbers representing allowed items
Output: Array containing hash keys

Explicit Rules:
-If input hash is empty, return nil
-If no suspect is found, return nil
-A suspect is a person carrying something that isnt allowed

Implicit Rules:
-Keys in output array should be sorted alphabetically
-If allowd items array is empty, return all keys

*EXAMPLES*
pockets = {
  bob: [1],
  tom: [2, 5],
  jane: [7]
}

find_suspects(pockets, [1, 2]) # => [:tom, :jane]

*DATA STRUCTURE*
Array - iteration, holding suspects

*ALGORITHM*
-Return hash keys if input array is empty
-Init suspects variable to empty array
-Iterate through input (pockets) hash
  -Check if any numbers in the value array match any number in the input array
  -If they do, add key to suspects array
-Return nil if suspects array is empty
-Sort suspects array and return it
=end

def find_suspects(pockets_hash, allowed_items)
  return nil if pockets_hash.empty? && allowed_items.empty?
  #return pockets_hash.keys if allowed_items.empty?
  suspects = []

  pockets_hash.each do |person, pocket|
    next if pocket == nil
    suspects << person if pocket.any? { |item| !allowed_items.include?(item) }
  end

  return nil if suspects.empty?
  suspects
end

# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

=begin
*PROBLEM*
Input: String
Output: String

Explicit Rules:
-Convert every 2nd char in every 3rd word to uppercase
-Leave other chars alone

Implicit Rules:
-Input str may contain upper and lowercase a-z
-Input wont be empty
-No punctuations, numbers

-Return same string object or new one?

*EXAMPLES*

*DATA STRUCTURE*
Array

*ALGORITHM*
-Split input string into array of words
-Iterate over words array with index
  -If index is a multiple of 3
    -Iterate through chars and indexes of current word
      -If index is odd, uppercase current char
-Join words back into string and return string
=end

def to_weird_case(str)
  str.split.map.with_index do |word, word_idx|
    if (word_idx + 1) % 3 == 0
      word.chars.map.with_index do |char, char_idx|
        char_idx.odd? ? char.upcase : char
      end.join
    else
      word
    end
  end.join(' ')
end

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') #==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".


=begin
Complete the greatest_pProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

*PROBLEM*
Input: String
Output: Integer

Explicit Rules:
-Find greatest product of five consecutive digits

Implicit Rules:
-Input wont be empty
-Input will only contain 0-9

*DATA STRUCTURE*
Array to hold products

*ALGORITHM*
-Init products variable to empty array
-Split input into array of digits
-Iterate over digits array with indexes
  -Find the product of numbers from current index to index plus 4 - stop iterating if there are less than 5 nums from end
  -Add product to products variable
-Return largest value in products
=end

def greatest_product(str)
  products = []
  digits = str.chars.map(&:to_i)

  digits.each_index do |idx|
    break if idx == digits.size - 4
    current_product = digits[idx..idx + 4]
    products << current_product.inject(:*)
  end

  products.max
end
p greatest_product("123834539327238239583") #== 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

=begin TIME TAKEN 6:20
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

*PROBLEM*
Input: String
Output: Boolean

Explicit Rules:
-Detect whether input is a pangram
-A pangram uses every letter of the alphabet
-Upper/lowercase the same
-Ignore numbers/punctuation

Implicit Rules:
-String wont be empty

*DATA STRUCTURE*
Array

*ALGORITHM*
-Create an alphabet variable containing a-z
-Downcase the input
-Split input into array of chars
-Iterate over chars array
  -Delete current char in alphabet variable
-Check if alphabet variable is empty
=end

def panagram?(str)
  alpha = ('a'..'z').to_a
  str.downcase.each_char do |char|
    alpha.delete(char)
  end
  alpha.empty?
end

p panagram?("The quick brown fox jumps over the lazy dog.") == true
p panagram?("This is not a pangram.") == false


=begin
https://www.codewars.com/kata/5264d2b162488dc400000001

Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.


*PROBLEM*
Input: String
Output: String

Explicit Rules:
-Reverse words that are five or more letters
-Strings will be only letters and spaces

Implicit Rules:
-Spaces separated words
-Input wont be empty
-Letters are a-z

Examples:
spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
spinWords( "This is a test") => returns "This is a test"
spinWords( "This is another test" )=> returns "This is rehtona test"

*DS*
Array

*ALGORITHM*
-Split input into array of words
-Iterate through words array
  -If current word is 5 or more chars, reverse it
  -Else leave it alone
-Join array into string and return it
=end

def spin_words(str)
  str.split.map do |word|
    word.size >= 5 ? word.reverse : word
  end.join(' ')
end

# test cases

p spin_words("Welcome") == "emocleW"
p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"

=begin

Write a function

triple_double(num1, num2)
which takes numbers num1 and num2 and returns 1 if there is a straight triple of a number at any place in num1 and also a straight double of the same number in num2.

If this isn't the case, return 0

*PROBLEM*
Input: 2 Integers
Output: Integer

Explicit Rules:
-Return 1 if there is a num from num1 that is a straight triple in num1 and straight double in num2
-Return 0 if there isnt

Implicit:
-Input wont be empty

Examples:
triple_double(451999277, 41177722899) == 1
# num1 has straight triple 999s and  num2 has straight double 99s

triple_double(1222345, 12345) == 0
# num1 has straight triple 2s but num2 has only a single 2

triple_double(12345, 12345) == 0

triple_double(666789, 12345667) == 1

*DS*
Array

*ALGORITHM*
-Convert both inputs to string
-Split string1 into array of digits
-Iterate over digits array
  Check if current num times 3 is included in first num
  Check if current num times 2 is included in second num
  -Return 1 if both are true
-Return 0

=end

def triple_double(num1, num2)
  num1 = num1.to_s
  num2 = num2.to_s

  num1.each_char do |num|
    return 1 if num1.include?(num * 3) && num2.include?(num * 2)
  end

  0
end

# test cases
p triple_double(451999277, 41177722899) #== 1
 p triple_double(1222345, 12345)== 0
p triple_double(12345, 12345) == 0
p triple_double(666789, 12345667) == 1
p triple_double(10560002, 100)== 1
p triple_double(1112, 122) == 0



def special_reverse_string(input)
  characters = input.chars.select {|x| x != " "}
  result = ""
  upcase_chars = ('A'..'Z').to_a
  input.chars.each do |char|
    if char == " "
      result << " "
    else
      if ["!", ",", ".", "?"].include?(characters.last)
        result << characters.pop
      else
        upcase_chars.include?(char) ? result << characters.pop.upcase : result << characters.pop.downcase
      end
    end
  end
  result
end


p special_reverse_string('Edabit') == 'Tibade'
p special_reverse_string('UPPER lower') == 'REWOL reppu'
p special_reverse_string('1 23 456') == '6 54 321'
p special_reverse_string('Hello World!') == '!dlro Wolleh'
p special_reverse_string("Where's your dog Daisy?") == "?ysiadg odru oys 'erehw"
p special_reverse_string('addition(3, 2) = 5') == '5=)2,3(noit id d a'
p special_reverse_string("It's known that CSS means Cascading Style Sheets") == "Stee hsely tsgn IDA csacs Naemsscta Htnwo Nks'ti"




# Given a string s, return true if the s can be palindrome after deleting at most one character from it.
# Example 1:

# Input: s = "aba"
# Output: true
# Example 2:

# Input: s = "abca"
# Output: true
# Explanation: You could delete the character 'c'.
# Example 3:

# Input: s = "abc"
# Output: false

=begin
*PROBLEM*
Input: string
Output: Boolean

Rules:
-Delete at most 1 char and return true/false if the remaining chars are a palindrome

Implicit Rules:
-Input will not be empty
-Input will only contain lowercase a-z

*EXAMPLES*
"abca"
"bca" X
"aca" - true
"abc" X

*DATA STRUCTURE*
Array - to hold possible palindromes

*ALGORITHM*
-Init results variable to empty array
-Find all combinations of the input with one letter removed
  -Split input into array of chars
  -Iterate over chars array with index
    -Combine all other chars besides the one at current index
    -Join them together into a string and add it to results array
-Iterate through results
  -Check if any strings are palindromes
  -If any are found, return true
-Otherwise return false
=end

def palindrome?(str)
  str == str.reverse
end

def f(str)
  str.chars.each_with_index do |char, idx|
    new_str = str[0...idx] + str[idx + 1..-1]
    return true if palindrome?(new_str)
  end
  false
end



 p f("aba") # true
 p f("abca") # true
 p f("abc") #false
p f("rotatzor") # true
 p f("deinfied") #true
 p f("deifidfged") # false



=begin

https://www.codewars.com/kata/52763db7cffbc6fe8c0007f8

Gandalf's writings have long been available for study, but no one has yet figured out what language they are written in. Recently, due to programming work by a hacker known only by the code name ROT13, it has been discovered that Gandalf used nothing but a simple letter substitution scheme, and further, that it is its own inverse|the same operation scrambles the message as unscrambles it.

This operation is performed by replacing vowels in the sequence 'a' 'i' 'y' 'e' 'o' 'u' with the vowel three advanced, cyclicly, while preserving case (i.e., lower or upper).

Similarly, consonants are replaced from the sequence 'b' 'k' 'x' 'z' 'n' 'h' 'd' 'c' 'w' 'g' 'p' 'v' 'j' 'q' 't' 's' 'r' 'l' 'm' 'f' by advancing ten letters.

So for instance the phrase 'One ring to rule them all.' translates to 'Ita dotf ni dyca nsaw ecc.'

The fascinating thing about this transformation is that the resulting language yields pronounceable words. For this problem, you will write code to translate Gandalf's manuscripts into plain text.

Your job is to write a function that decodes Gandalf's writings.

Input
The function will be passed a string for the function to decode. Each string will contain up to 100 characters, representing some text written by Gandalf. All characters will be plain ASCII, in the range space (32) to tilde (126).

For each string passed to the decode function return its translation.

*PROBLEM*
Input: string
Output: string

Rules:
-Replace vowels with the vowel at current vowel position plus 3 in aiyeou
-Replace consonants with consonant at current position plus 10 in ......
-If position hits the end of the sequence, wrap around to the beginning
Implicit Rules:
-Input wont be empty
-Input will only contain a-z
-Preserve original case

*DATA STRUCTURE*
Array - to hold sequences / iteration

*ALGORITHM*
Helper method: vowel_transform(string) -> string
-Init vowels variable to array with seuqnece
-Find the index of the input str in the vowels array
-Add 3 to the index
-If new index is greater than the size of vowels arr
  -Find the difference between array size and new index
-New index is the difference
-Return element in vowels array at that index

Helper method: consonant_transform(string) - > string
-Init consonants variable to array with sequence
-Find index in consonants var
-Add 10 to it
--If new index is greater than the size of consonants arr
  -Find the difference between array size and new index
-New index is the difference
-Return element in vowels array at that index

Main method:
-Iterate through chars of input string
  -If current char is a vowel
    -Replace it with the vowel 3 positions later
  -If current char is a consonant
    -Replace it with the consonant 10 positions later

-Return transformed string
=end
VOWELS = %w(a i y e o u)
CONSONANTS = %w(b k x z n h d c w g p v j q t s r l m f)

def vowel_transform(str)
  vowels = VOWELS.zip(1..6).to_h
  new_idx = vowels[str] + 3
  if new_idx > vowels.size
    new_idx = new_idx - vowels.size
  end
  vowels.key(new_idx)
end

def consonant_transform(str)
  consonants = CONSONANTS.zip(1..20).to_h
  new_idx = consonants[str] + 10
  if new_idx > consonants.size
    new_idx = new_idx - consonants.size
  end
  consonants.key(new_idx)
end

def tongues(str)
  new_str = str.downcase.chars.map do |char|
    if VOWELS.include?(char)
      vowel_transform(char)
    elsif CONSONANTS.include?(char)
      consonant_transform(char)
    else
      char
    end
  end.join

  str[0] == str[0].upcase ? new_str.capitalize : new_str
end

# test cases
 p tongues('Ita dotf ni dyca nsaw ecc.') #== 'One ring to rule them all.'
 p tongues('Tim oh nsa nowa gid ecc fiir wat ni liwa ni nsa eor ig nsaod liytndu.') == 'Now is the time for all good men to come to the aid of their country.'
 p tongues('Giydhlida etr hakat uaedh efi iyd gidagensadh pdiyfsn ytni nsoh') == 'Fourscore and seven years ago our forefathers brought unto this'
 p tongues('litnotatn e tam tenoit.') == 'continent a new nation.'
 p tongues('Nsa zyolv pdimt gij xywbar ikad nsa cequ rifh.') == 'The quick brown fox jumped over the lazy dogs.'

 =begin
Create a function that takes an argument n and sums even Fibonacci numbers up to n's index in the Fibonacci sequence.

Example:

sum_fibs(5) == 2 # (0, 1, 1, 2, 3, 5); 2 is the only even number in the sequence and doesn't have another number in the sequence to get added to in the indexed Fibonacci sequence.
Example:

sum_fibs(9) == 44 # (0, 1, 1, 2, 3, 5, 8, 13, 21, 34);
# 2 + 8 + 34 = 44;

*PROBLEM*
Input: Integer
Output: Integer

Explicit Rules:
-Find fibonacci numbers from 0 up to input
-Find the sum of even numbers in that range

Implicit Rules:
-Input wont be empty
-Input will be positive integer
-Fibonacci sequence is the last 2 numbers in the sequence added together
  -That number is added to the end
  -Starts at 0 and 1

*DATA STRUCTURE*
Array to hold fibonacci numbers

*ALGORITHM*
Helper method fib_sequence(integer) -> Array
-Init fibo variable to array with 0 and 1
-Until the array size is equal to input + 1
  -Add the last 2 numbers in the array together
  -Add that number to the end of the array
-Return fibo array

Main method
-Init sum variable to 0
-Get fibo sequence from helper method
-Iterate through fibo array
  -If number is even, add it to sum variable
-Return sum variable
=end

def fib_sequence(num)
  fibo = [0, 1]
  until fibo.size == num + 1
    fibo << fibo.last(2).sum
  end
  fibo
end

def sum_fibs(num)
  sum = 0
  fib_arr = fib_sequence(num)
  fib_arr.each do |n|
    sum += n if n.even?
  end
  sum
end

#p fib_sequence(5)

p sum_fibs(5) #== 2
 p sum_fibs(9)#, 44)
 p sum_fibs(10)#, 44)
 p sum_fibs(11)#, 44)


=begin
Write a simple parser that will parse and run Deadfish.

Deadfish has 4 commands, each 1 character long:

i increments the value (initially 0)
d decrements the value
s squares the value
o outputs the value into the return array
Invalid characters should be ignored.

parse("iiisdoso")  ==>  [8, 64]


*PROBLEM*
Input: String
Output: Array

Explicit Rules
-See above

Implicit Rules
-Input wont be empty
-Input will be lowercase a-z


*EXAMPLES*
p parse("ioioio")
value:
[1, 2, 3]

*DATA STRUCTURE*
-Array to hold output values

*ALGORITHM*
-Init results variable to empty array
-Init value variable to 0
-Split input str into array of chars
-Iterate through chars array
  -if char is i, increment value by 1
  -if char is d, decrement value by 1
  -if char is s, square value
  -if char is o, push value to results
-Return results array
=end

def parse(str)
  results = []
  value = 0

  str.each_char do |char|
    case char
    when "i" then value += 1
    when "d" then value -= 1
    when "s" then value = value ** 2
    when "o" then results << value
    end
  end

  results
end


p parse("ooo") == [0, 0, 0]
 p parse("iiisdoso") == [8, 64]
 p parse("ioioio") == [1, 2, 3]
 p parse("idoiido") == [0, 1]
p parse("isoisoiso") == [1, 4, 25]
 p parse("codewars") == [0]




=begin
https://www.codewars.com/kata/525dfedb5b62f6954d000006

DESCRIPTION:
You've just recently been hired to calculate scores for a Dart Board game!

Scoring specifications:

0 points - radius above 10
5 points - radius between 5 and 10 inclusive
10 points - radius less than 5
If all radii are less than 5, award 100 BONUS POINTS!

Write a function that accepts an array of radii (can be integers and/or floats), and returns a total score using the above specification.

An empty array should return 0.

*PROBLEM*
Input: Array, may contain integers or floats
Output: Integer

Rules:
-Return the total score based on the scoring specifications above
-Input may be empty - return 0

Implicit Rules:
-

Examples:
scoreThrows( [1, 5, 11] )    =>  15
10 + 5 + 0

scoreThrows( [15, 20, 30] )  =>  0
scoreThrows( [1, 2, 3, 4] )  =>  140
10 + 10 + 10 + 10 = 40 + 100 = 140

*DATA STRUCTURE*
Array - iteration

*ALGORITHM*
-Return 0 if input is empty
-Init score variable to 0
-Check if all nums in input array are less than 5
  -If they are, incrememnt score by 100
-Iterate over input array
  -If num is less than 5, increment score by 10
  -If num is 5 up to and including 10, increment score by 5
  -If num is above 10, leave score as is
-Return score
=end

def scoreThrows(arr)
  score = 0
  score += 100 if arr.all? { |num| num < 5 }

  arr.each do |num|
    case
    when num < 5 then score += 10
    when num <= 10 then score += 5
    else next
    end
  end
  #   if num < 5
  #     score += 10
  #   elsif num <= 10
  #     score += 5
  #   else
  #     next
  #   end
  # end

  score
end

 p scoreThrows([1, 5, 11]) == 15
 p scoreThrows( [15, 20, 30] )  ==  0
p scoreThrows( [1, 2, 3, 4] )  #==  140

# case some_var
# when 0..5 then "something "




=begin
https://www.codewars.com/kata/5a1cb5406975987dd9000028

You are given an array of integers. Your task is to sort odd numbers within the array in ascending order, and even numbers in descending order.

Note that zero is an even number. If you have an empty array, you need to return it.

For example:

[5, 3, 2, 8, 1, 4]  -->  [1, 3, 8, 4, 5, 2]

odd numbers ascending:   [1, 3,       5   ]
even numbers descending: [      8, 4,    2]

*PROBLEM*
Input: Array
Output: Array

Explicit Rules:
-Given an array:
-Sort the odd numbers ascending
-Sort the even numbers descending
-0 is an even number
-Return empty array if input is empty

Implicit Rules:
-Numbers will be integers

*DATA STRUCTURE*
Array to hold odd/even nums
Hash?

*ALGORITHM*
-Init odd_nums to empty arr
-Init even_nums to empty arr
-Iterate through input array with indexes
  -Add odd nums and idx to odd_nums, even nums and idx to even_nums
-Sort odd_nums ascending
-Sort even_nums descending

-Iterate over even_nums
  -Insert element 1 at the index of element 2 into odd_nums

-Return odd_nums
=end

def sort_array(arr)
  odd_nums = []
  even_nums = []
  odd_idx = []
  even_idx = []
  arr.each_with_index do |num, idx|
    if num.odd?
      odd_nums << num
      odd_idx << idx
    else
      even_nums << num
      even_idx << idx
    end
  end
  odd_sorted = odd_nums.sort
  even_sorted = even_nums.sort.reverse

  odd_idx.each_with_index do |idx, current_idx|
    arr[idx] = odd_sorted[current_idx]
  end

  even_idx.each_with_index do |idx, current_idx|
    arr[idx] = even_sorted[current_idx]
  end

  arr

end


def sortme(arr)
  even, odd = arr.partition{|item| item.even?}

  odd_idx = ##
  even = even.sort.reverse.fill('X', even.size...arr.size)


  # odd.sort.each do |num, idx|
  #   # insert at the index
  #   even.insert(,num)
  # end
  # even
end

p sortme([5, 3, 2, 8, 1, 4, 11]) #== [1, 3, 8, 4, 5, 2, 11]
#  p sort_array([2, 22, 37, 11, 4, 1, 5, 0]) == [22, 4, 1, 5, 2, 11, 37, 0]
#  p sort_array([1, 111, 11, 11, 2, 1, 5, 0]) == [1, 1, 5, 11, 2, 11, 111, 0]
#  p sort_array([]) == []




=begin
https://www.codewars.com/kata/54e6533c92449cc251001667
Implement the function unique_in_order which takes as argument a sequence and returns a list of items without any elements with the same value next to each other and preserving the original order of elements.

For example:

unique_in_order('AAAABBBCCDAABBB') == ['A', 'B', 'C', 'D', 'A', 'B']
unique_in_order('ABBCcAD')         == ['A', 'B', 'C', 'c', 'A', 'D']
unique_in_order([1,2,2,3,3])       == [1,2,3]

*PROBLEM*
Input: String or Array
Output: Array

Explicit Rules:
-Return a list of chars that dont have the same value as the char next to it
-Preserve the original order of the chars

Implicit Rules:
-Array will contain integers
-String will be a-z lower and uppercase
-Input wont be empty
-Uppercase and lowercase letters are not the same

*EXAMPLES*
p unique_in_order('AAAABBBCCDAABBB')
'A'

*DATA STRUCTURE*
Array to hold results / iteration

*ALGORITHM*
-Init results variable to empty array
-If input is a string reassign it to an array of chars

-Iterate over input array of chars/nums with indexes
  -Skip current char if its equal to previous char
  -Otherwise add current char to results array

-Return results
=end

def unique_in_order(sequence)
  sequence = sequence.chars if sequence.is_a? String
  return [sequence[0]] if sequence.uniq.size == 1

  results = []
  sequence.each_with_index do |char, idx|

    next if char == sequence[idx - 1]
    results << char
  end

  results
end



def unique_in_order(sequence)
  sequence = sequence.chars if sequence.is_a?String

  sequence.each_with_object([]) do |element, unique_order|
    unique_order << element unless element == unique_order.last
  end
end



# test cases
p unique_in_order('AAAABBBCCDAABBB') == ['A','B','C','D','A','B']
 p unique_in_order("AA") == ["A"]
 p unique_in_order("AADD") == ["A", "D"]
 p unique_in_order('ABBCcAD')  == ['A', 'B', 'C', 'c', 'A', 'D']
p unique_in_order([1,2,2,3,3]) == [1,2,3]



=begin
https://www.codewars.com/kata/5966847f4025872c7d00015b


You are given a string of numbers between 0-9. Find the average of these numbers and return it as a floored whole number (ie: no decimal places) written out as a string. Eg:

"zero nine five two" -> "four"

If the string is empty or includes a number greater than 9, return "n/a"

*PROBLEM*
Input: String
Output: String

Explicit Rules:
-Given a string of numbers:
-Find the average of these numbers
-Return the floored (rounded down) whole number as a string
-Return n/a if input is empty or isnt 0-9

Implicit Rules:
-Input will be lowercase a-z

*EXAMPLES*
p average_string("zero nine five two")
0 9 5 2 = 16 / 4 = 4 = four

*DATA STRUCTURE*
Hash for string/integer equivalents
Array - split strings/iteration

*ALGORITHM*
-Init nums variable to a hash with zero-nine as keys, 0-9 as values
-Return "n/a" if input is empty or input string is not included in hash keys

-Split the input string at spaces into an array of words
-Iterate over words array
  -Transform current word into its integer equivalent in the nums hash
-Find the sum of numbers in the array
  -Divide by the size of the array
-Return the key of the average number from the nums hash
=end

def average_string(str)
  nums = %w(zero one two three four five six seven eight nine).zip(0..9).to_h
  split_str = str.split(' ')
  return "n/a" if str.empty? || split_str.any? { |num| !nums.keys.include?(num) }

  average = split_str.map do |word|
              nums[word]
            end.sum / split_str.size

  nums.key(average)
end
# test cases

p average_string("zero nine five two") #== "four"
p average_string("four six two three") == "three"
p average_string("one two three four five") == "three"
p average_string("five four") == "four"
p average_string("zero zero zero zero zero") == "zero"
p average_string("one one eight one") == "two"
p average_string("one") == "one"


p average_string("") #== "n/a"
p average_string("ten") #== "n/a"
p average_string("pippi") #== "n/a"


=begin
This kata was seen in programming competitions with a wide range of variations. A strict bouncy array of numbers, of length three or longer, is an array that each term (neither the first nor the last element) is strictly higher or lower than its neighbours.

For example, the array:

arr = [7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8] (length = 16)

The two longest bouncy subarrays of arr are

[7,9,6,10,5,11,10,12] (length = 8) and [4,2,5,1,6,4,8] (length = 7)

According to the given definition, the arrays [8,1,4,6,7], [1,2,2,1,4,5], are not bouncy.

For the special case of length 2 arrays, we will consider them strict bouncy if the two elements are different.

The arrays [-1,4] and [0,-10] are both bouncy, while [0,0] is not.

An array of length 1 will be considered strict bouncy itself.

You will be given an array of integers and you should output the longest strict bouncy subarray.

In the case of having more than one bouncy subarray of same length, it should be output the subarray with its first term of lowest index in the original array.

Let's see the result for the first given example.

arr = [7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8]
longest_bouncy_list(arr) === [7,9,6,10,5,11,10,12]

See more examples in the example tests box.

Features of the random tests

length of the array inputs up to 1000
-500 <= arr[i] <= 500

Enjoy it!

*PROBLEm*
Input: Array
Output: Array

Explicit Rules:
-Return the longest bouncy sub array
-An array is bouncy if:
 the numbers next to each number are both less than or greater than that number
-First and last numbers of each sub array are ignored
-If sub array length is 2, it is bouncy if both elements are different
-If sub array length is 1, it is bouncy
-If there is more than one longest bouncy sub array, return the one whos first number has the lowest index in the input array

Implicit Rules:
-Input wont be empty
-Input will contain positive integers

*DATA STRUCTURE*
Array to hold sub arrays / iteration

*ALGORITHM*
Helper method gen_subarrays(array) -> array
get all subs algorithm
-Return all sub arrays

Helper method bouncy?(array) -> Boolean
-Return true if array size is 1
-Return true if array size is 2 and unique array size is not 1

-Iterate over input array with indexes
-Skip first and last indexes
-Return false if current num is not greater than the previous and next numbers or
  if its not less than previous/next
-Otherwise return true

Main method:
-Get all bouncy subs from gen_subs
-Find the longest bouncy sub
=end

def bouncy?(arr)
  return true if arr.size == 1
  return false if arr.size == 2 && arr.uniq.size == 1
  arr.each.with_index do |num, idx|
    next if idx == 0 || idx == arr.size - 1
    greater = num > arr[idx - 1] && num > arr[idx + 1]
    less = num < arr[idx - 1] && num < arr[idx + 1]
    return false if !greater && !less
  end
  true
end

def gen_subs(arr)
  subs = []
  (0...arr.size).each do |st|
    (st...arr.size).each do |nd|
      current_sub = arr[st..nd]
      subs << current_sub if bouncy?(current_sub)
    end
  end
  subs
end

def longest_bouncy_list(arr)
  bouncy_subs = gen_subs(arr).max_by(&:size)
end

 arr1 = [7,9,6,10,5,11,10,12,13,4,2,5,1,6,4,8]
 p longest_bouncy_list(arr1)#== [7,9,6,10,5,11,10,12]

arr2 = [7,7,7,7,7]
p longest_bouncy_list(arr2) #== [7]

 arr3 = [1,2,3,4,5,6]
 p longest_bouncy_list(arr3) #== [1,2]
