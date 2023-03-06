=begin
https://www.codewars.com/kata/53697be005f803751e0015aa
*PROBLEM*
Explicit Rules:
-INPUT: String
-Replace all lowercase vowels in the input string with numbers according to the following pattern:
a -> 1
e -> 2
i -> 3
o -> 4
u -> 5
-OUTPUT: Transformed Input String

*DATA STRUCTURE*
Hash for vowel values
Array for string transformation

*ALGORITHM*
-Initialize a vowels hash with each vowel as keys and values as 1-5
-Iterate through the characters of the input string.
  -If the current character is a key in the vowels hash:
    -Replace it with its hash value.
-Join the array of charactesr back into a string and return it.
=end

def encode(string)
  vowels_hash = {}
  'aeiou'.chars.each_with_index { |vowel, idx| vowels_hash[vowel] = (idx + 1).to_s }
  string.chars.map do |char|
    vowels_hash.keys.include?(char) ? vowels_hash[char] : char
  end.join
end

def decode(string)
  vowels_hash = {}
  'aeiou'.chars.each_with_index { |vowel, idx| vowels_hash[vowel] = (idx + 1).to_s }
  string.chars.map do |char|
    if vowels_hash.values.include?(char)
      vowels_hash.key(char)
    else
      char
    end
  end.join
end

p encode('hello') == 'h2ll4'
p encode('How are you today?') == 'H4w 1r2 y45 t4d1y?'
p encode('This is an encoding test.') == 'Th3s 3s 1n 2nc4d3ng t2st.'
p decode('h2ll4') == 'hello'

=begin
https://www.codewars.com/kata/58223370aef9fc03fd000071

Given a variable n,

If n is an integer, Return a string with dash'-'marks before and after each odd integer, but do not begin or end the string with a dash mark. If n is negative, then the negative sign should be removed.

If n is not an integer, return the string "nil".

dashatize(274) -> '2-7-4'
dashatize(6815) -> '68-1-5'
=end

=begin
*PROBLEM*
Explicit Rules:
-INPUT: Integer, might not be an integer.
-If input is an integer:
-Add a dash mark before and after each odd integer.
-Do not begin or end the string with a dash mark.
-Remove the negative sign if input is a negative number.

-Return string "nil" if input is not an integer.
-OUTPUT: String

*EXAMPLES*
p dashatize(274) == "2-7-4"
7 is an odd integer -7-

p dashatize(5311) == "5-3-22"
-5-3-22
*DATA STRUCTURE*
Array

*ALGORITHM*
-Return "nil" if input is not an integer.
-Set input number to its absolute value.
-Initialize a digits variable to an empty array.
-Iterate through the digits of the input number.
  -If the current number is odd
    -Add a dash "-" to the digits array unless the last element of the digits array is "-" or the digits array is empty.
    -Add the current odd number to the digits array
    -Add a dash "-" to the digits array unless the current number is at the last index.
  -Else add the current number to the digits array.
-Join the array of digits into a string and return it.
=end

def dashatize(number)
  return "nil" if !number.is_a?(Integer)
  number = number.abs.digits.reverse
  digits_array = []
  number.each_with_index do |num, idx|
    if num.odd?
      digits_array << "-" unless digits_array.last == "-" || digits_array.empty?
      digits_array << num
      digits_array << "-"
    else
      digits_array << num
    end
  end
  digits_array.pop if digits_array.last == "-"
  digits_array.join
end

p dashatize(274) == "2-7-4"
p dashatize(5311) #== "5-3-1-1"
p dashatize(86320) == "86-3-20"
p dashatize(974302) == "9-7-4-3-02"
p dashatize(nil) == "nil"
p dashatize(0) == "0"
p dashatize(-1) == "1"
p dashatize(-28369) == "28-3-6-9"

=begin
https://www.codewars.com/kata/52223df9e8f98c7aa7000062/train/ruby

How can you tell an extrovert from an introvert at NSA?
Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.

I found this joke on USENET, but the punchline is scrambled. Maybe you can decipher it?
According to Wikipedia, ROT13 is frequently used to obfuscate jokes on USENET.

For this task you're only supposed to substitute characters. Not spaces, punctuation, numbers, etc.

Test examples:

"EBG13 rknzcyr." -> "ROT13 example."

"This is my first ROT13 excercise!" -> "Guvf vf zl svefg EBG13 rkprepvfr!"
=end

=begin
*PROBLEM*
Explcit Rules:
-INPUT: String
-Substitute letters with the letter that is 13 letters past it (in the alphabet)
-If Z is hit, next letter starts at beginning of alphabet
-String may include numbers and other chars
-OUTPUT: String

Implicit Rules:
-Uppercase will be replaced with uppercase
-Lowercase will be replaced with lowercase

*EXAMPLES*
p rot13("EBG13 rknzcyr.") == "ROT13 example."

*DS*
Hash to store alphabet letters and their alpha positions
Array

*ALGORITHM*
-Create hash for alpha letters and positions
  -lowercase alpha letters # a-z
-Iterate through input str chars
  -If current char downcased is alpha letter # E
    -Find position of current char # r
    -Add 13 to it
    -If the total is more than 26, subtract the total from 26 to find the difference
    -Replace with the letter at that position
    -replace it with the letter 13 positions from current position i
      -if current char is uppercase, uppercase the letter replacing it

-Return modified string
=end

def rot13(str)
  new_str = ''
  alpha_hash = (1..26).to_a.zip('a'..'z').to_h

  str.chars.map do |char|
    if alpha_hash.values.include?(char.downcase)
      current_pos = alpha_hash.key(char.downcase)
      new_pos = current_pos + 13
      if new_pos > 26
        new_pos = 13 - (26 - current_pos)
      end
      char == char.upcase ? alpha_hash[new_pos].upcase : alpha_hash[new_pos]
    else
      char
    end
  end.join
end

def rot13(string)
  string.chars.map do |char|
    if ('a'..'m').include?(char) || ('A'..'M').include?(char)
      (char.ord + 13).chr
    elsif ('n'..'z').include?(char) || ('N'..'Z').include?(char)
      (char.ord - 13).chr
    else
      char
    end
  end.join
end

def rot13(string)
  alpha = {}
  ('a'..'z').each_with_index { |letter, idx| alpha[idx+1] = letter }
  upcase_alpha = {}
  ('A'..'Z').each_with_index { |letter, idx| upcase_alpha[idx+1] = letter }

  string.chars.map do |char|
    if alpha.values.include?(char)
      char = alpha.key(char) + 13
      alpha.keys.include?(char) ? alpha[char] : "z"
    elsif upcase_alpha.values.include?(char)
      char = upcase_alpha.key(char) + 13
      upcase_alpha.keys.include?(char) ? upcase_alpha[char] : "Z"
    else
      char
    end
  end.join
end


# test cases
p rot13("EBG13 rknzcyr.") #== "ROT13 example."
p rot13("Va gur ryringbef, gur rkgebireg ybbxf ng gur BGURE thl'f fubrf.")

=begin
https://www.codewars.com/kata/55de8eabd9bef5205e0000ba/train/ruby

If you reverse the word "emirp" you will have the word "prime". That idea is related with the purpose of this kata: we should select all the primes that when reversed are a different prime (so palindromic primes should be discarded).

For example: 13, 17 are prime numbers and the reversed respectively are 31, 71 which are also primes, so 13 and 17 are "emirps". But primes 757, 787, 797 are palindromic primes, meaning that the reversed number is the same as the original, so they are not considered as "emirps" and should be discarded.

The emirps sequence is registered in OEIS as A006567

Your task
Create a function that receives one argument n, as an upper limit, and the return the following array:

[number_of_emirps_below_n, largest_emirp_below_n, sum_of_emirps_below_n]


find_emirp(10)
[0, 0, 0] ''' no emirps below 10 '''

find_emirp(50)
[4, 37, 98] ''' there are 4 emirps below 50: 13, 17, 31, 37; largest = 37; sum = 98 '''

find_emirp(100)
[8, 97, 418] ''' there are 8 emirps below 100: 13, 17, 31, 37, 71, 73, 79, 97; largest = 97; sum = 418 '''

Happy coding!!

Advise: Do not use a primality test. It will make your code very slow. Create a set of primes using a prime generator or a range of primes producer. Remember that search in a set is faster that in a sorted list or array

*PROBLEM*
Explicit Rules:
-INPUT: Integer representing upper limit
-Find all prime numbers from 1 up to the input.
-Select all prime numbers that are not palindromes.
-OUTPUT: [number of non palindrome prime #s, largest non palindrome prime #, sum of all non palindrome #s]

*EXAMPLES*
p find_emirp(50)

*DS*
Array

*ALGORITHM*
-Initialize primes variable to empty array
-Find all prime #s from 1 up to the input # add them to primes
-Iterate over primes array
  -Select numbers whos digits are not equal to its reversed digits
-Return an array with:
  -Find the count of primes Array
  -Find the largest prime # in the primes array
  -Sum of the primes array
=end
require 'prime'

def find_emirp(max_num)
  primes = []
  (1..max_num).each { |num| primes << num if num.prime? }

  primes.select! { |num| num.digits != num.digits.reverse }
  primes.select! { |num| num.digits.join.to_i.prime? }

  [primes.size, primes.max, primes.sum]
end

# test cases
p find_emirp(50) == [4, 37, 98]
p find_emirp(100) == [8, 97, 418]
p find_emirp(200) == [15, 199, 1489]
p find_emirp(500) == [20, 389, 3232]
p find_emirp(750) == [25, 743, 6857]
p find_emirp(1000) == [36, 991, 16788]


=begin
https://www.codewars.com/kata/52bc74d4ac05d0945d00054e/train/ruby

Write a function named first_non_repeating_letter that takes a string input, and returns the first character that is not repeated anywhere in the string.

For example, if given the input 'stress', the function should return 't', since the letter t only occurs once in the string, and occurs first in the string.

As an added challenge, upper- and lowercase letters are considered the same character, but the function should return the correct case for the initial letter. For example, the input 'sTreSS' should return 'T'.

If a string contains all repeating characters, it should return an empty string ("") or None -- see sample tests.

*PROBLEM*
*explicit rules:
-INPUT: String
-Find first char that is non repeating
-Upper and lowercase are considered the same
-Return correct case of original letter
-OUTPUT: String

*EXAMPLES*
first_non_repeating_letter('moonmen')

*DS*
Array

*ALGORITHM*
-Initialize an empty array to hold non repeating letters
-Iterate through input string
  -Add current char to array if its count is 1 in the downcased input string
-Return the first char in the array
=end

def first_non_repeating_letter(str)
  return '' if str.empty?
  non_repeating = []
  str.each_char do |char|
    non_repeating << char if str.downcase.count(char.downcase) == 1 # stress
  end
  non_repeating.empty? ? "" : non_repeating.first
end

# test cases
# p first_non_repeating_letter('a') == 'a'
# p first_non_repeating_letter('stress') == 't'
# p first_non_repeating_letter('sTreSS') # expects T
#  p first_non_repeating_letter('moonmen') == 'e'
# p first_non_repeating_letter('') == ''
p first_non_repeating_letter("abba")
p first_non_repeating_letter("aa")


=begin
https://leetcode.com/problems/time-needed-to-buy-tickets/

2073. Time Needed to Buy Tickets
Easy
612
38
Companies
There are n people in a line queuing to buy tickets, where the 0th person is at the front of the line and the (n - 1)th person is at the back of the line.

You are given a 0-indexed integer array tickets of length n where the number of tickets that the ith person would like to buy is tickets[i].

Each person takes exactly 1 second to buy a ticket. A person can only buy 1 ticket at a time and has to go back to the end of the line (which happens instantaneously) in order to buy more tickets. If a person does not have any tickets left to buy, the person will leave the line.

Return the time taken for the person at position k (0-indexed) to finish buying tickets.

Example 1:

Input: tickets = [2,3,2], k = 2
Output: 6
Explanation:
- In the first pass, everyone in the line buys a ticket and the line becomes [1, 2, 1].
- In the second pass, everyone in the line buys a ticket and the line becomes [0, 1, 0].
The person at position 2 has successfully bought 2 tickets and it took 3 + 3 = 6 seconds.
Example 2:

Input: tickets = [5,2,3,1], k = 0 # 3
Output: 8
Explanation:
- In the first pass, everyone in the line buys a ticket and the line becomes [4, 0, 0, 0].
- In the next 4 passes, only the person in position 0 is buying tickets.
The person at position 0 has successfully bought 5 tickets and it took 4 + 1 + 1 + 1 + 1 = 8 seconds.
=end

=begin
*PROBLEM*
Explciit Rules:
-Input: Array with numbers representing how many tickets each person wants to buy.
        -Integer representing the index of the person in the array that you want to find the time for.
-OUTPUT: Num representing time it takes for K index to buy all of their tickets

*DATA STRUCTURE*
Array

*ALGORITHM*
-Initialize time_count to 0
-Until the count of K index person is 0:
  -Iterate through the tickets array
  -Decrease the count of each element by 1
  -For each element that is greater than 0:
    -Add 1 to time_count
-Return time_count

=end

def time_required_to_buy(tickets, k)
  time_count = 0
  until tickets[k] == 0

    new = []

    tickets.each do |ticket|
      if ticket == 0
        new << 0
        next
      end

      new << ticket -= 1
      if new[k] == 0
        time_count += 1
        break
      else
      time_count += 1
      end
    end

    tickets = new

  end
  time_count
end

=begin
*PROBLEM*
Explicit Rules:
-Input: Array of integers
-Return the two numbers closest together in value.
-Output: Array of 2 integers

Implicit Rules:
-Input will only contain integers.
-Input will always contain at least 3 integers.

*EXAMPLES*
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
differences:
5, 25 = 20
5, 15 = 10
5, 11 = 6
5, 20 = 15

25, 15 = 10
25, 11 = 14
25, 20 = 5

15, 11 = 4 -> Smallest difference returned in array in order that they appear.
15, 20 = 5

11, 20 = 9

p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

*DATA STRUCTURE*
Hash with the difference being the key and an array of both numbers being compared as the value.

*ALGORITHM*
-Initialize a differences variable to an empty hash.
-Iterate over each number of the input array.
  -On each iteration find the difference of the current number and each number after it in the input array.
    -
  -Set the difference as a key in the differences hash and the two numbers being compared as the value.
  -The value should be an array [current number, number being compared].
-Find the smallest hash key.
-Return the value of the smallest hash key.
=end

# def closest_numbers(array)
#   differences = {}

#   array.each_with_index do |num1, num1_idx|
#     array[num1_idx + 1..-1].each do |num2|
#       current_difference = (num1 - num2).abs
#       next if differences.keys.include?(current_difference)
#       differences[current_difference] = [num1, num2]
#     end
#   end

#   smallest_difference = differences.keys.min
#   differences[smallest_difference]
# end

# p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
# p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
# p closest_numbers([12, 7, 17]) == [12, 7]
#=========================================

=begin
*PROBLEM*
Explicit Rules:
-Input: Array (sorted), Integer (target value)
-Array will contain distinct integers.
-If the target value is found in the input array, return the index of the target.
-If its not found, return the index where it would be if it were inserted.
-Output: Integer (target value index)

Implicit Rules:

*EXAMPLES*
p search_insert([1,3,5,6], 5) == 2
5 is in the input array at the 2 index.

p search_insert([1,3,5,6], 2) == 1
2 is not in the input array.
2 would be inserted between 1 and 3 at the 1 index.

p search_insert([1,3,5,6], 7) == 4
7 is not in the input array.
7 would be inserted after 6, at the 4 index.

*DATA STRUCTURE*

*ALGORITHM*
-Check if the target value is in the input array.
  -If it is, return the index of the target value.

-If the target value is not found in the input array:
  -Insert the target value where it should be in order.
    -Append the target value to the end of the input array.
    -Sort the input array by numeric value.
    -Return the index of the target value.
=end

# def search_insert(array, target)
#   return array.index(target) if array.include?(target)
#   array << target
#   array.sort.index(target)
# end

# p search_insert([1,3,5,6], 5) == 2
# p search_insert([1,3,5,6], 7) == 4
# p search_insert([1,3,5,6], 2) == 1

#===============================================================
=begin
*PROBLEM*
Explicit Rules:
-INPUT: Nested Arrays. Each nested array represents the horizontal rows.
-Determine if a 9x9 Sudoku board is valid.
-Valid means each row must contain the digits 1-9 with no repeats;
-Each column must contain the digits 1-9 with no repeats;
-And each of the 9 3x3 boxes must contain the digits 1-9 with no repeats.
-A partially filled board could be valid but not always solvable.
-OUTPUT: Boolean, determined by the validity of the board.

Implicit Rules:
-

*EXAMPLES*
board =
[["5","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]

-Each sub array represents each horizontal row.
-The first elements of each sub array represent each vertical column.

-Elements 1-3 of subarrays 1,2,3 represent the first 3x3 box.
-Elements 4-6 of subarrays 1,2,3 represent the second 3x3 box.
-Elements 7-9 of subarrays 1,2,3 represent the third 3x3 box.

-Elements 1-3 of subarrays 4,5,6 represent the fourth 3x3 box.
-Elements 4-6 of subarrays 4,5,6 represent the fifth 3x3 box.
-Elements 7-9 of subarrays 4,5,6 represent the sixth 3x3 box.

-Elements 1-3 of subarrays 7,8,9 represent the seventh 3x3 box.
-Elements 4-6 of subarrays 7,8,9 represent the eighth 3x3 box.
-Elements 7-9 of subarrays 7,8,9 represent the ninth 3x3 box.

3 times
initialize empty array
Iterate over 0...9 representing the index of each subarr.
On each iteration add the first 3 elements from the current subarr to empty array.


board =
[["8","3",".",".","7",".",".",".","."]
,["6",".",".","1","9","5",".",".","."]
,[".","9","8",".",".",".",".","6","."]
,["8",".",".",".","6",".",".",".","3"]
,["4",".",".","8",".","3",".",".","1"]
,["7",".",".",".","2",".",".",".","6"]
,[".","6",".",".",".",".","2","8","."]
,[".",".",".","4","1","9",".",".","5"]
,[".",".",".",".","8",".",".","7","9"]]

*DATA STRUCTURE*

*ALGORITHM*
1. Check if each horizontal row (sub array) is valid by checking if there are duplicate numbers.
Valid row helper method:
-Input: Array of strings
-Check if the count of each number 1-9 in the input array is greater than 1
  -If it is, return false (representing an invalid row)
  -Else return true (representing a valid row)
-Output: Boolean

2. Check if each column (the first element of each sub array) is valid by check if there are duplicate numbers
Valid column helper method:
-Input: Nested arrays.
-Initialize a column variable to an empty array.
-Iterate through the nested array input. On each iteration:
  -Add the first element of the current sub array to the column variable.
-Check if the count of each number 1-9 in the input array is greater than 1
  -If it is return false (invalid column)
  -Else return true (valid column)

3. Check if each 3x3 box is valid by checking if there are duplicate numbers.
Valid box helper method:

4. Main method.
-Check if all of the 9 rows (subarrays) are valid.
  -Iterate over a range of 0 up to but not including 9. This will act as the index. On each iteration:
    -Check if the input nested array at the current index is a valid_row?.
=end

def valid_array?(array)
  (1..9).each { |num| return false if array.count(num.to_s) > 1 }
  true
end

def valid_rows?(array)
  array.all? { |row| valid_array?(row) }
end

def valid_columns?(board)
  index = 0
  until index == 9
    column = []
    board.each { |row| column << row[index] }
    return false if valid_array?(column) == false
    index += 1
  end
  true
end

def valid_squares?(board)
  squares = (0..2)# [3..5], [6..8]
  (0...9).each do |row_index|
    p board[row_index][squares]
  end
end

def is_valid_sudoku(board)
  valid_columns?(board)
  valid_rows?(board)

end

board =
[["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]]

p valid_squares?(board)

#Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them but in a different order. Your output should look something like this:

#"demo" => ["demo", "dome", "mode"]
#"neon" => ["neon", "none"]
#(etc)

=begin
Goal: write a program that organized an array into sub arrays of its anagrams sorted by words that are anagrams of each other.
input: array
output: hash

Rules:
- anagram is a word that has the exact same letters in it but in a different order
E:

[[["demo", "dome", "mode"], ["neon", "none"]]

hash = {
  "demo" => ["demo", "dome", "mode"]
  "neon" => ["neon", "none"]
  ...
}
puts hash.values

D:
input: array
output: hash

A:
- initialize an empty hash
- iterate over the given array.
  - if the word converted to a character array sorted exists as a key in the hash already, push the word into the array of anagrams in the value
  - otherwise initialize a new key value pair with the word as the key and as the first element in the array object in the value
- return the hash's values on separate lines
=end
hash = {}
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

result = {}

words.each do |word|
  key = word.split('').sort.join
  p key
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |v|
  puts "------"
  p v
end

=begin
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times. The input string consists of lowercase latin letters. Your function should return a tuple (in Python) (t, k) or an array (in Ruby and JavaScript) [t, k]
Example #1:
for string
s = "ababab" the answer is
["ab", 3] Example #2:
for string
s = "abcde" the answer is
  because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

input: non-empty String `s`
output: an array [t, k]
Rules:
- `s` : argument String, t * k
- `t` : minimum substring
- `k` : maximum number
input string `s` is of lowercase latin letters

find all the substrings of string `s`
find the substring that repeats itself more than once
then find the number of occurrences for that substring in the input string s

=end

def f(s)
  substrings = []

  0.upto(s.size-1) do |n|
    n.upto(s.size-1) do |i|
      substrings << s[n..i] if s[n..i].size > 1
    end
  end

  t = substrings.max_by do |sub|
    if substrings.all? {|sub| substrings.count(sub) == 1}
      sub.size
    else
      substrings.count(sub)
    end
  end
  k = substrings.count(t)

  [t, k]
end

# p f("ababab") == ["ab", 3]
# p f("abcdcdcdab") == ["cd", 3]
# p f("abcde") == ["abcde", 1]

=begin
2200. Find All K-Distant Indices in an Array
https://leetcode.com/problems/find-all-k-distant-indices-in-an-array/
Add to List
Share
You are given a 0-indexed integer array nums and two integers key and k. A k-distant index is an index i of nums for which there exists at least one index j such that |i - j| <= k and nums[j] == key.
Return a list of all k-distant indices sorted in increasing order.
Example 1:
i - j
j = index of key
Input: nums = [3,4,9,1,3,9,5], find_it = 9, k_distance = 1
2 9's
indexes 2 and 5
look k indices distance, start at 2, look at up from there k distance.  Looking k away from our key, finding all the indices that satisfy it.  Are there neighbors to this index?
Output: [1,2,3,4,5,6]
Explanation: Here, nums[2] == key and nums[5] == key.
- For index 0, |0 - 2|> k and |0 - 5| > k, so there is no j where |0 - j| <= k and nums[j] == key. Thus, 0 is not a k-distant index.
- For index 1, |1 - 2| <= index_add and nums[2] == find_it, so 1 is a k-distant index.
- For index 2, |2 - 2| <= k and nums[2] == key, so 2 is a k-distant index.
- For index 3, |3 - 2| <= k and nums[2] == key, so 3 is a k-distant index.
- For index 4, |4 - 5| <= k and nums[5] == key, so 4 is a k-distant index.
- For index 5, |5 - 5| <= k and nums[5] == key, so 5 is a k-distant index.
- For index 6, |6 - 5| <= k and nums[5] == key, so 6 is a k-distant index.
Thus, we return [1,2,3,4,5,6] which is sorted in increasing order.
Example 2:
Input: nums = [2,2,2,2,2], key = 2, k = 2
Output: [0,1,2,3,4]
Explanation: For all indices i in nums, there exists some index j such that |i - j| <= k and nums[j] == key, so every index is a k-distant index.
Hence, we return [0,1,2,3,4].
Constraints:
1 <= nums.length <= 1000
1 <= nums[i] <= 1000
key is an integer from the array nums.
1 <= k <= nums.length
Accepted
29.2K
=end

=begin
Algorithm:
-Initialize a key_index variable to an empty array that will hold the indexes of the key in the input array.
-Iterate over the input array with indexes
-  If the current element is equal to the Key
-    Add the current index to the key_index variable
-Intialize a k_index variable to an empty array.
- iterate over `nums` with Index
  - if (current_index - key_index) absolute value is less than or equal to k
    - push this current_index into k_index
- return k_index
=end

# arr = [0, 0, 1, 0, 1]
# p select_arry = arr.each_with_index.select { |num, index| num > 0 }
# select_arry.map do |pair|
#   p pair[1]
# end
def find_k_distant_indices(nums, key, k)
  k_index_array = nums.each_with_index.select { |num, index| num == key}.map {|pair| pair[1]}
  k_distance = []
  k_index_array.each do |key_index|
    nums.each_with_index do |num, current_index|
      if (current_index - key_index).abs <= k
        k_distance << current_index
      end
    end
  end
  k_distance.uniq
end
#p find_k_distant_indices([3,4,9,1,3,9,5], 9, 1) == [1, 2, 3, 4, 5, 6]
p find_k_distant_indices([2,2,2,2,2], 2, 2) == [0, 1, 2, 3, 4]
#p find_k_distant_indices([1,2,3,4,5,6,7], 4, 2) == [1,2,3,4,5]
#                                     5 - 3 >> 2 >> key_index
#                                     6 - 3 >> 3 >> nothing

=begin
Requirements:
-Write a method named to_weird_cae that accepts a string.
-Return the same sequence of characters with every 2nd character in every third word converted to uppercase.
-Other characters should remain the same.

Examples:
p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'

p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Intialize a counter variable to 2 which will act as an indicator for every third word.
-Split the input string into an array of words.
-Iterate over the array of words and their indexes., On each iteration:
-  If the counter is equal to the current index:
     Increment the counter variable by 3.
-    Iterate over the characters of the current word and their indexes. On each iteration:
-      If the current index is odd, uppercase the current character.
-
-
=end

def to_weird_case(string)
  counter = 2
  string.split.map.with_index do |word, word_idx|
    if counter == word_idx
      counter += 3
      word.chars.map.with_index do |char, char_idx|
        char_idx.odd? ? char.upcase : char
      end.join
    else
      word
    end
  end.join(' ')
end


p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

#=============================================
=begin
Requirements:
-Write a method that takes an array of consecutive letters as input and that retunr the missing letter in the array.
-You will always get a valid array. It will always be exactly one letter missing. The length will always be at least 2.
-The array will contain letters in only one case.

Examples:
['a','b','c','d','f'] => 'e'
1 2 3 4 6
DS:
Input: Array
Intermediate: ?
Output: String

Algorithm:
-Intialize an alpha variable to an array containing the letters in the range of the first letter of the input array to the last letter of the input array.
-Subtract the input array from the alpha variable and return the missing letter.
=end

# def missing(array)
#   ((array.first..array.last).to_a - array)[0]
# end

# p missing(['a','b','c','d','f'])

=begin
Input: Array
Output: String

Algorithm:
-Initialize a word variable to the first word in the input array.
-Iterate over a range of 0 up to but not including the size of the word variable.
-On each iteration, check if every word of the input array matches the characters of word variable at the index range of 0 to the current index.
-Return that string if it does.
=end

def common_prefix(arr)
  prefix = []
  word = arr[0]
  (0...word.size).each do |index|
    str = word[0..index]
    prefix << str if arr.all? { |w| w[0..index] == str }
  end
  prefix.empty? ? '' : prefix.last
end

p common_prefix(%w(flower, flow, fliwht)) == 'fl'
p common_prefix(%w(dog racecar car)) == ''
p common_prefix(%w(interspecies interstellar interstate)) == 'inters'
p common_prefix(%w(throne dungeon)) == ''
p common_prefix(%w(throne throne)) == 'throne'
#==================================================

=begin
Requirements:
-Given a string.
-Find the length of the longest substring without repeating characters.

Examples:
p length_of_longest_substring("abcabcbb") "abc" length of 3.

DS:
Input: String
Intermediate: Array for substrings
Output: Integer

Algorithm:
-Substrings helper method:
-Initialize a substrings variable.
-Iterate over a range of 0 up to but not including the size of the input string. This will act as the starting index.
-On each iteration:
-Iterate over a range of the starting index up to but not including the size of the input string. This will act as the end index.
-On each iteration:
-Add the input string at the index range of the starting index to the end index to the substrsings variable.
-Return the substrings variable.

-Main method:
-Initialize a substrings variable to the return invoking the substrings method and passing the input str as an arg.
-Initialize a no_repeats variable to an empty array.
-Iterate over the substrings variable.
-On each iteration:
-Iterate through the characters of the current substring
-On each iteration:
-Add the current substring to the no_repeats variable if the current substring already includes the current character.
-Sort the no_repeats array by size and return the size of the longets substring.
=end

# def substrings(str)
#   substrings = []

#   (0...str.size).each do |st_idx|
#     (st_idx...str.size).each do |end_idx|
#       substrings << str[st_idx..end_idx]
#     end
#   end

#   substrings
# end
# #p substrings("abcabcbb")
# def length_of_longest_substring(str)
#   substrings = substrings(str)
#   no_repeats = []

#   substrings.each do |substr|
#     if substr.chars.all? { |char| substr.count(char) == 1 }
#       no_repeats << substr
#     end
#   end

#   no_repeats.map(&:size).max
# end
def length_of_longest_substring(str)
  no_repeats = []

  (0...str.size).each do |st_idx|
    (st_idx...str.size).each do |end_idx|
      substr = str[st_idx..end_idx]
      if substr.chars == substr.chars.uniq
        no_repeats << substr
      end
    end
  end

  no_repeats.map(&:size).max
end

p length_of_longest_substring("abcabcbb")
p length_of_longest_substring("pwwkew")
p length_of_longest_substring("vqovfzayjuamyvspmkciqbllqnnaryyoqmjxnmwwgykgtdxfnanfdaqvngyggw")

=begin
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence of an array of integers.
Easy case is when input array is all positive, then return total sum of array.
If total array is made up of only negative numbers, return 0 instead.
Empty array assumed to have 0 greatest sum. Note the empty array is also a valid subarray.

=end

=begin
Requirements:
-Find the maximum sum of a contiguous subsequence of an array of integers.
-Return total sum of array if input array is all positive.
-Return 0 if array is made up of only negative numbers

Examples:
max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6

max_sequence([]) == 0
max_sequence([11]) == 11
max_sequence([-32]) == 0
max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

https://www.codewars.com/kata/54521e9ec8e60bc4de000d6c

DS:
Input: Array
Intermediate: Array
Output: Integer

Algorithm:
-Return 0 if the input array is empty or all negative numbers.
-Return the sum of the input array if all numbers are positive.

-Find all substrings of the input array.

-Initialize a sums variable to an empty array.
-Add the sum of each substring to the sums variable.
-Return the maximum value of the sums variable.
=end

def max_sequence(array)
  return 0 if array.empty? || array.all? { |num| num < 0 }
  return array.sum if array.all? { |num| num > 0 }

  (0...array.size).each_with_object([]) do |st_idx, sums|
    (st_idx...array.size).each { |end_idx| sums << array[st_idx..end_idx].sum }
  end.max
end





p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([]) == 0
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
=====================================================================
Study with amy
=begin

Given 2 strings, find out if there is a substring that appears in both strings. Return true if you find a substring that appears in both strings, or false if not. Only consider substrings that are longer than one letter long.

Goal: intake 2 strings and return true if program can find a substring that appears in both strings, or false otherwise

input: two strings
output: boolean

Rules:
- only consider substrings that are longer than 1 letter long
- if any input is empty string return False
- strings contain alphanumeric chars only
- capital and lower case letters aer considered the same

E:
input: 'Something', 'Fun')
output: false
Explanation: no substring found greater than one letter

input: 'Something', 'Home')
output:  true
Explanation: 'ome' >> common substring

input: 'Something', '')
output: false
Ex: empty string input example returns false

p substr_test('', 'Something') == false

input: 'Banana', 'banana')
output: true
Explanation: one word is a substring of the other

input: 'test', 'lllt')
out: false
Ex: only one letter in common >> false

p substr_test('', '') == false

input: '1234567', '541256')
out: true
Ex: '56' are found in both

input: 'supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou')
out: true
ex: share 'ociou' >> true

D:
intermediate: array of substrings

A:
- find all the substrings of the smaller input word
- iterate over the array
  - return true if any of the substrings greater than size 1 in the array appear in the other input word

=end

def substr_test(array1, array2)
  return false if array1.empty? || array2.empty?
  (0...array1.size).each do |st_idx|
    (st_idx...array1.size).each do |end_idx|
      substring = array1[st_idx..end_idx].downcase
      return true if array2.include?(substring) && substring.size > 1
    end
  end
  false
end

# def substr_test(string1, string2)
#   return false if string1.empty? || string2.empty?
#   string1.size >= string2.size ? string2_array = string2.downcase.chars : string1_array = string1.downcase.chars
#   if string2_array
#     substrings(string2_array).map(&:join).each do |word|
#       return true if string1.include?(word)
#     end
#   elsif string1_array
#     substrings(string1_array).map(&:join).each do |word|
#       return true if string2.include?(word)
#     end
#   end
#   false
# end

p substr_test('Something', 'Fun') == false
p substr_test('Something', 'Home') == true
p substr_test('Something', '') == false
p substr_test('', 'Something') == false
p substr_test('Banana', 'banana') == true
p substr_test('test', 'lllt') == false
p substr_test('', '') == false
p substr_test('1234567', '541256') == true
p substr_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true
p substr_test('SoundOfItIsAtrociou', 'supercalifragilisticexpialidocious') == true



=begin
Requirements:
-Write a method to find the longest common prefix string amonst an array of strings.
-If ther eis no common prefix, return an emtpy string. ''.
-All given inputs are in lowercase letters a-z.

Examples:
p common_prefix(["flower", "flow", "flight"])
output: "fl"

p common_prefix(["dog", "racecar", "car"])
output: ""

DS:
Input: Array
Intermediate:
Output: String

Algorithm:
-Initialize a prefix variable to an empty string.
-Initialize a first_word variable set to the first index of the input array.
-Iterate over the characters of the first_word variable.
-On each iteration:
-  Check if all of the words of the input array include the current character at the current index.
-  If it does:
-    Add the current character to the prefix variable.
-  If not, stop iterating.
-Return the prefix variable.
=end

def common_prefix(array)
  prefix = ''
  first_word = array[0]
  first_word.chars.each_with_index do |char, index|
    array.all? { |word| word[index] == char } ? prefix << char : break
  end
  prefix
end

p common_prefix(["flower", "flow", "fliwht"])
p common_prefix(["interspecies", "interstellar", "interstate"])
p common_prefix(["dog", "racecar", "car"])

=begin
Requirements:
-Given 2 strings.
-Find out if there is a substring that appears in both strings.
-You will return true if you find a substring that appearsi n both strings.
-Return false if not.
-Only care about substrings that are longer than just one letter.

Examples:
p substring_test('Something', 'Fun')
Fu Fun un

p substring_test('Something', 'Home')
p substring_test('BANANA', 'banana')

DS:
Input: 2 Strings
Intermediate:
Output: Boolean

Algorithm:

-Iterate over a range of 0 up to but not including the size of the first string arg. This will act as the starting index.
-On each iteration:
-  Iterate over a range of the starting index up to but not including the size of the first string arg. This will act as the end index.
-  On each iteration:
-  Initialize a current substring variable to the first string arg at the index range of the starting index to the end index.
-  Return the current substring if the second string argument includes the current substring and the current substrings size is greater than 1.
=end

# def substring_test(string1, string2)
#   (0...string1.size).each do |st_idx|
#     (st_idx...string1.size).each do |end_idx|
#       current_substring = string1[st_idx..end_idx].downcase
#       p current_substring
#       return true if string2.include?(current_substring) && current_substring.size > 1
#     end
#   end
#   false
# end

# def substring_test(str1, str2)
#   str1_chars = str1.downcase.chars
#   str2_chars = str2.downcase.chars
#   str1_chars.each_with_index do |char1, idx1|
#     str2_chars.each_with_index do |char2, idx2|
#       p [char1, char2]
#       p [str1_chars[idx1 + 1], str2_chars[idx1 + 1]]
#     end
#   end
# end

# p substring_test('Something', 'Home')
# p substring_test('BANANA', 'banana')

=begin
Requirements:
-Write a function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.
-Only lower case letters will be used. No punctuation or digits will be included.

Examples:

DS:
Input: Two strings
Intermediate:
Output: Boolean

Algorithm:
-Iterate through the characters of the second string argument.
-On each iteration:
-  Check if the first string argumnet includes the current character and
-  Check if the count of the current character is equal to the count of the current character in the first string argument.
-  Return false if its not.
-  Otherwise return true
=end

def scramble(str1, str2)
  str2.chars.each do |char|
    return false if str1.count(char) < str2.count(char)
  end
  true


end

p scramble('javaass', 'jjss')
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') #== true
p scramble('katas', 'steak')
p scramble('scriptjava', 'javascript')
p scramble('scriptingjava', 'javascript')


# Find length of the longest substring in the given string that is the same in reverse.
# As an example, if the input ws "I like racecars that go fast", the substring ('racecar') length would be 7.
# If the length of the input string is 0, return value must be 0.
# p longest_palindrome('a') == 1
# p longest_palindrome('aa') == 2
# p longest_palindrome('baa') == 2
# p longest_palindrome('aab') == 2
# p longest_palindrome('baabcd') == 4
# p longest_palindrome('baablkj12345432133d') == 9
# p longest_palindrome("I like racecars that go fast") == 7

=begin
Requirements:
-Find length of the longest substring in the given string that is the same in reverse.

Examples:
p longest_palindrome("I like racecars that go fast") == 7
the substring racecar is the longest substring that is a plandrome and its size is 7

DS:
Input: String
Intermediate: Array
Output: Integer

Algorithm:
-Initialize a palindromes variable to an empty array.
-Iterate through a range of 0 up to but not including the size of the input string. this will act as the start index.
-On each iteration:
- Iterate trhough a range of the start index up to but not including the size of the inputs tring. this will act as the end index.
-On each iteration:
- Intialize a current_substring variable to the input string at the index range of start index to end index.
- If current_substring is equal to current_substring in reverse, add it to the palindromes variable.
-Sort the palindromes variable by size
-Return the size of the longest string.
=end

def longest_palindrome(string)
  palindromes = []
  (0...string.size).each do |st_idx|
    (st_idx...string.size).each do |end_idx|
      current_substring = string[st_idx..end_idx]
      palindromes << current_substring if current_substring == current_substring.reverse
    end
  end
  palindromes.max_by { |str| str.size }.size
end

 p longest_palindrome('a') == 1
 p longest_palindrome('aa') == 2
 p longest_palindrome('baa') == 2
 p longest_palindrome('aab') == 2
 p longest_palindrome('baabcd') == 4
 p longest_palindrome('baablkj12345432133d') == 9
p longest_palindrome("I like racecars that go fast") #== 7

=begin
Requirements:
-Write a function that accepts an array of 10 integers between 0 and 9.
-Return a string of those numbers in the form of a phone number.

Examples:
createPhoneNumber([1, 2, 3, 4, 5, 6, 7, 8, 9, 0]) # => returns "(123) 456-7890"

DS:
Input: Array
Intermediate:
Output: String

Algorithm:
-Iterate over the numbers and indexes of the input array.
-If index is 0, add a ( before the current number.
-If index is 2, add a ) and a space after the current number.
-If index is 5, add a - after the current number
-Else leave the number alone.
-Join the array into a string and return it.
=end

def create_phone_number(numbers)
  numbers.map.with_index do |num, idx|
    num = num.to_s
    case idx
    when 0 then '(' + num
    when 2 then num + ') '
    when 5 then num + '-'
    else        num
    end
  end.join
end

# p create_phone_number([1, 2, 3, 4, 5, 6, 7, 8, 9, 0])

#=======================================================
=begin
Requirements:
-Write a function unique_in_order which takes a sequence as an argument and returns a list of items without any elements with the same value next ot each other and preserving the original order of elements.

Examples:
unique_in_order('AAAABBBCCDAABBB')
['A', 'B', 'C', 'D', 'A', 'B']
unique_in_order('ABBCcAD')
['A', 'B', 'C', 'c', 'A', 'D']
unique_in_order([1,2,2,3,3])
[1, 2, 3]

DS:
Input: String or Array
Intermediate: Array
Output: Array

Algorithm:
-Initialize a unique_order variable to an empty array.
-If input sequence is string: split into chars.
-If input sequence is array: do nothing.
-Iterate over the input sequence
-On each iteration:
-Add the current element to the unique_order variable unless the current element is equal to the last element of the unique_order variable.
-Return unique_order variable.
=end

def unique_in_order(sequence)
  sequence = sequence.chars if sequence.is_a?String
  sequence.each_with_object([]) do |element, unique_order|
    unique_order << element unless element == unique_order.last
  end
end

# p unique_in_order('AAAABBBCCDAABBB')
# p unique_in_order([1,2,2,3,3])

#===========================================================
=begin
Requirements:
-Complete a method so that it converts dash/underscore delimited words into camel casing.
-The first word within the output should be capitalized only if the original word was capitalized. The next words should be always capitalized.

Examples:
p to_camel_case("the-stealth-warrior")
theStealthWarrior - first word not capitalized because original wasnt.

p to_camel_case("The_Stealth_Warrior"
TheStealthWarrior - first word capitalized because original was .

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Initialize a split string variable to the input string split at the delimiter of '-'
-If the input string includes "_", reassign split string variable to the input string split at the "_" delimiter.

-Iterate over the split words array and their indexes.
-If the first word is not capitalized, dont capitalize it.
- Else capitalize every word.
-Join the array of words back into a string and return it.
=end

def to_camel_case(string)
  split_str = string.include?('-') ? string.split('-') : string.split('_')

  split_str.map.with_index do |word, index|
    index == 0 ? word : word.capitalize
  end.join
end

# p to_camel_case("the-stealth-warrior")
# p to_camel_case("The_Stealth_Warrior")

#================================================================
=begin
Requirements:
-Given a string.
-Each word in the string will contain a single number.
-The number is the position the word should have in the result.
-Numbers can be from 1 to 9 to 1 will be the first word (not 0).
-If the input string is empty return an empty string. The words in the input string will only contain valid consecutive numbers.

Examples:
"is2 Thi1s T4est 3a" - "Thi1s is2 3a T4est"

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Initialize a ordered variable to an empty array.
-Split the input string into an array of words.
-Iterate over the split words and on each iteration:
-  Initialize an index variable.
-    Iterate over the characters of the current word.
-      On each iteration set the current character to the index variable if converted to an integer is not equal to 0.
-  Add the current word to the order variable at the current index.
-Join the ordered variable into a string and return it.
=end

def order(string)
  new = []
  split_string = string.split
  split_string.map do |word|
    index = nil

    word.chars.each { |char| index = char.to_i - 1 if char.to_i != 0 }
    new.insert(index, word)
    new.delete(nil)
  end
  new
end

# #p order("is2 Thi1s T4est 3a")
# #p order("4of Fo1r pe6ople g3ood th5e the2")

def palindrome?(string)
  string == string.reverse
end

def substrings(string)
  palindrome_substrings = []
  (0...string.size).each do |st_idx|
    (st_idx...string.size).each do |end_idx|
      substring = string[st_idx..end_idx]
      palindrome_substrings << substring if palindrome?(substring)
    end
  end
  palindrome_substrings
end

def longest_palindrome(string)
  palindrome_substrings = substrings(string)
  palindrome_substrings.max_by(&:size).size
end

# p longest_palindrome("baabadccbabbbabababacd")

#=====================================
=begin
Requirements:
-Write a method that takes an array and moves all of the zeroes to the end, preserving the order of the other elements.

Examples:
moveZeros [1,2,0,1,0,1,0,3,0,1] #-> [1,2,1,1,3,1,0,0,0,0]

DS:
Input: Array
Intermediate: Array
Output: Array

Algorithm:
-Initialize a moved_zeroes variable to an empty array.
-Iterate through the input array, on each iteration:
- Move the current number to the moved_zeroes variable if its not equal to 0.
-Find the count of zeroes in the input array and add that many 0 to the end of the moved_zeroes variable.
-Return the moved_zeroes variable.
=end

def moveZeros(array)
  moved_zeroes = []
  array.each { |num| moved_zeroes << num if num != 0 }
  array.count(0).times { moved_zeroes << 0 }
  moved_zeroes
end

# p moveZeros([1,2,0,1,0,1,0,3,0,1])

#================================================
=begin
Requirements:
-Move the first letter of each word to the end of it.
-Add "ay" to the end of the word.
-Leave punctuation untouched.

Examples:
pig_it("Pig latin is cool") == "igPay atinlay siay oolcay"

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Split the input string into an array of words.
-Iterate over the array of words. On each iteration:
-  Move the first letter to the end of the word and add 'ay' onto the end of the word.
-Join the array of words back into a string and return it.
=end

def pig_it(string)
  string.split.map do |word|
    word = word.chars
    word.push(word.delete(word[0]))
    word.join + 'ay'
  end.join(' ')
end

def pig_it(text)
  string = ''
  counter = 0
  loop do
    break if counter >= text.size
  string[counter] << string[counter][0]
    counter += 1
    end
end

# p pig_it("Pig latin is cool")

#======================================================
=begin
Requirements:
-Write a function that takes a string of parentheses.
-Determine if the order of the parentheses is valid.
-The function shoudl return true if the string is valid and false if not.

DS:
Input: String
Intermediate: Array
Output: Boolean

Algorithm:
-Initialize an array variable to an empty array.
-Initialize a counter to 0
-Iterate through the chars of the input string. On each iteration:
- Add the current character to the array variable if it is ( or )
=end

def valid_parentheses(string)
  counter = 0
  string.chars.each do |char|
    counter += 1 if char == '('
    counter -= 1 if char == ')'
    p counter
    return false if counter < 0
  end
  counter == 0

end

# p valid_parentheses("hi())(")
# p valid_parentheses("hi(hi)()")

#+===========================================
def reverse(arr)
  counter = -1
  arr.each_with_index do |char, idx|
    arr[idx], arr[counter] = arr[counter], arr[idx]
    counter -= 1
    break if counter < -arr.size / 2
  end
#   arr

# end
# original = ["h", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d"]
# #p reverse(["h","e","l","l","o"])
# reversed = reverse(original)
# p [original, original.object_id]
# p [reversed, reversed.object_id]

#============================================
=begin
Requirements:
Given two strings, s and t
-Return true if s is a subsequence of t, false otherwise.
-A subsequence of a string is a new string that is formed from the original string by deleteing some of the characters without disturbing the relative positions of the remaining characters.

Examples:
"abc" "ahbgdc" => true, a b c appear in the second string in order.
"axc" "ahbgdc" => false a x c dont appear in the second string in order.

DS:
Input: Two Strings
Intermediate:
Output: Boolean

Algorithm:
-Delete the characters of the first string argument from the second string argument.
-Determine if the strings are equal.
=end
def is_subsequence(str1, str2)
  str2.chars.uniq.select { |char| str1.include?(char) }.join #== str1
end

# p is_subsequence("abc", "ahbgdc")
# p is_subsequence("ab", "baab")


=begin
https://www.codewars.com/kata/5904be220881cb68be00007d

*PROBLEM*
Explicit Rules:
-INPUT: String representing a shoal of fish.
-Find out how many fish you can eat and the size you will grow to.
-Only fish that are smaller or the same size can be eaten.
-Your size starts at 1.
-Input (shoal) will contain integers 0-9 representing fish size.
-Fish size of 0 wont feed you.
-You can eat fish in any order.
-You can only eat each fish once.
-OUTPUT: Integer representing your maximum size.

*EXAMPLES*
Your size starts at 1 - at current size fish have to be 1 or less to eat them

shoal = "11112222"

=> 4 fish of size 1
=> 4 fish of size 2

1+1+1+1 = 4, 4 fish needed for next size, size is now 2. - fish now have to be less <= 2 to be eaten.
2+2+2+2 = 8, 8 fish needed for next size, size is now 3.

max size = 3

*DATA STRUCTURE*
Array

*ALGORITHM*
-Initialize a next_size_amounts variable to array of 4 8 12 16 20 24
-Initialize a your_size variable to 1.
-Initialize a shoal variable to the input string as an array of integers.
-Initialize a food variable to 0.
-Iterate over the shoal array.
-On each iteration:
  -If the size of the current fish is less than or equal to your_size
    -Incremenet the food variable by the size of the current fish.
=end

def fish(input)
  initial = 8
  next_size_amounts = [4, 12] #-> 4 12 24 40 60 84 #n = 4, n += 4 {total size += n# }
  your_size = 1 # 2 3
  food = 0
  shoal = input.chars.map(&:to_i).sort

  shoal.each do |fish_size| #
    if fish_size <= your_size #
      food += fish_size # 4
    end

    if food >= next_size_amounts[your_size - 1] #
      your_size += 1 #
      initial += 4
      next_size_amounts << next_size_amounts.last + initial
    end
  end
  your_size
end

# 4 12 24 40 60 84
#  8 12 16 20 24



# p fish("11112222")
# p fish("111122223333")

p fish("") == 1
p fish("0") == 1
p fish("6") == 1
p fish("1111") == 2
p fish("11112222") == 3
p fish("111122223333") == 4
p fish("111111111111") == 3
p fish("111111111111111111112222222222") == 5
p fish("151128241212192113722321331") == 5
#Sorting on planet Twisted-3-7
=begin
There is a planet... in a galaxy far far away. It is exactly like our planet, but it has one difference: #The values of the digits 3 and 7 are twisted. Our 3 means 7 on the planet Twisted-3-7. And 7 means 3.

Your task is to create a method, that can sort an array the way it would be sorted on Twisted-3-7.

7 Examples from a friend from Twisted-3-7:

[1,2,3,4,5,6,7,8,9] -> [1,2,7,4,5,6,3,8,9]
[12,13,14] -> [12,14,13]
[9,2,4,7,3] -> [2,7,4,3,9]
=end

=begin
goal: sort all the values as if 7 and 3 were switched in value
input: array of numbers
output: sorted array of numbers
rules :
will always have at least one number
no nils

data structures:
arrays

Algorithm

=end
def translator(arr)

  number_hash = { "1" => 1,
              "2" => 2,
              "3" => 7,
              "4" => 4,
              "5" => 5,
              "6" => 6,
              "7" => 3,
              "8" => 8,
              "9" => 9,
              "0" => 0
  }

  string_numbers = arr.map do |nums|
     nums.digits.reverse.map do |num|
      if number_hash.values.include?(num)
        number_hash.key(num)
      end
    end
  end
end

def string_to_i(arr)
  arr.map do |pairs|
    pairs.join.to_i
  end
end

def sort_twisted37(arr)
  string_numbers = translator(arr).sort
  sorted_nums = string_to_i(string_numbers).sort
  sorted_strings = translator(sorted_nums)
  string_to_i(sorted_strings)
end

p sort_twisted37([1,2,3,4,5,6,7,8,9]) == [1,2,7,4,5,6,3,8,9]
p sort_twisted37([12,13,14]) == [12,14,13]
p sort_twisted37([9,2,4,7,3]) == [2,7,4,3,9]


=begin
You've been working with a lot of different file types recently as your interests have broadened.

But what file types are you using the most? With this question in mind we look at the following problem.

Given a List/Array of Filenames (strings) files return a List/Array of string(s) containing the most common extension(s). If there is a tie, return a sorted list of all extensions.

Important Info:
Don't forget, you've been working with a lot of different file types, so expect some interesting extensions/file names/lengths in the random tests.
Filenames and extensions will only contain letters (case sensitive), and numbers.
If a file has multiple extensions (ie: mysong.mp3.als) only count the last extension (.als in this case)

examples:
files = ['Lakey - Better days.mp3',
         'Wheathan - Superlove.wav',
         'groovy jam.als',
         '#4 final mixdown.als',
         'album cover.ps',
         'good nights.mp3']

would return: ['.als', '.mp3'], as both of the extensions appear two times in files.

files = ['Lakey - Better days.mp3',
         'Fisher - Stop it.mp3',
         'Fisher - Losing it.mp3',
         '#4 final mixdown.als',
         'album cover.ps',
         'good nights.mp3']
would return ['.mp3'], because it appears more times then any other extension, and no other extension has an equal amount of appearences.

=end

=begin
*PROBLEM*
Explicit Rules:
-INPUT: Array of strings
-Find the most common extension.
-If there is more than one of the same amount, return a sorted list.
-Strings will only contain letters and numbers.
-Letters are case sensitive
-Only count the last extension if there are multiple extensions.
-OUTPUT: Array

*DATA STRUCTURE*
Array
Hash?

*ALGORITHM*
-Initialize an extensions variable to a hash with a default value of 0.
-Iterate over each word.
-On each iteration:
  -Iterate over the chars and indexes of the current word (reversed) 'Better days.mp3.wav'
  -When current character is "."
    -Add the word at the index range of 0 to the current index to the extensions Hash and increment teh value by 1.
-Return the key or keys of the max value in the hash.
-If there are multiple max values, sort them and return them.

=end

def solve(files_arr)
  extensions = Hash.new { |k, v| [k] = 0 }
  files_arr.each do |word|
    reversed = word.reverse
    reversed.chars.each_with_index do |char, idx|
      if char == "."
        extensions[reversed[0..idx].reverse] += 1
      end
    end
  end
  result = []
  extensions.each do |ext, count|
    if count == extensions.values.max
      result << ext
    end
  end
  result.sort
end

# test cases
files = ['Lakey - Better days.mp3',
             'Wheathan - Superlove.wav',
             'groovy jam.als',
             '#4 final mixdown.als',
             'album cover.ps',
             'good nights.mp3']
p solve(files) == ['.als', '.mp3']

files = ['Lakey - Better days.mp3',
             'Fisher - Stop it.mp3',
             'Fisher - Losing it.mp3',
             '#4 final mixdown.als',
             'album cover.ps',
             'good nights.mp3']
p solve(files) == ['.mp3']


=begin
For a given string s find the character c with longest consecutive repetition and return:
[c, l]
where l is the length of the repetition. If there are two or more characters with the same l return the first in order of appearance.

For empty string return:
["", 0]

*PROBLEM*
Explicit Rules:
-INPUT: String
-Find the character with the longest consecutive reptitions.
-Return an array with the character and length of reptitions.
-Return ["", 0] for empty string inputs.
-OUTPUT: Array

*EXAMPLES*
p longest_repetition("aaaabb")
p longest_repetition("bbbaaabaaaa")
b = 3
a = 3
b = 1
a = 4

*DATA STRUCTURE*
Array
Hash?

*ALGORITHM*
-Initialize a hash with uniq chars from the input string as keys and values as 0.
-Initialize a current_count variable to 1.
-Iterate through the chars of the input string. # b b
  -If the next char is equal to the current char, increment current_count by 1. # 3
    -If its not, set current_count to 1.
  -If the count of current char in the hash is less than the current_count: # 3
    -Set the current count as the new value in the hash.
-Find the key/value pair with the highest value.
-Return the pair in an array.
=end

def longest_repetition(string)
  return ['', 0] if string.empty?
  hash = {}
  string.chars.uniq.each { |char| hash[char] = 0 }
  current_count = 1
  string.chars.each_with_index do |char, idx|
    if char == string[idx+1]
      current_count += 1
    else
      current_count = 1
    end

    if current_count > hash[char]
      hash[char] = current_count
    end
  end
  max = hash.values.max
  hash.each { |k, v| return [k, v] if v == max }
end
#p longest_repetition("aaaabb") #==['a', 4]
#  p longest_repetition("bbbaaabaaaa") ==['a', 4]
# p longest_repetition("cbdeuuu900") ==['u', 3]
# p longest_repetition("abbbbb") ==['b', 5]
p longest_repetition("aabb") #==['a', 2]
 p longest_repetition("ba") #==['b', 1]
#p longest_repetition("") == ['', 0]
 p longest_repetition("aaabbcccddd") #==['a', 3]




=begin
#RB Advanced PEDAC!

# Given an array of n positive integers and a positive integer, find the minimal length of a contiguous subarray for which the sum >= integer.
=begin
I: arr of n ints, int
O: length
A:
see if original array has num >= int
see if arrays of length 2 has sum >= int
  -iterate over arr and make subarrays of length 2 starting with each index
continue increasing arr length until length = arr.size
if not found, return 0
=end

=begin
*PROBLEM*
Explicit Rules:
-INPUT: Array of integers, a positive integer.
-Find the smallest subarray that has a sum >= integer argument.
-OUTPUT: Integer

Implicit Rules:
-Return 0 if there are no subarray sums >= integer

*DATA STRUCTURE*
Arrays

*ALGORITHM*
-Find all combintions of numbers.
  Helper method to find all subarrays:
  -Initialize subarrays variable []
  -Iterate over 0...input.size - start index
  -Iterate over start_index...input.size - end index
  -Add input[start..end] to subarrays
  -Return subarrays

-Find the sum of each combination.
  -Main method:
  -Initialize sums variable []
  -Get all subarrays from subarray method.
  -Iterate over each subarray

-Store the combinations whose sum is >= integer argument

  -Find the sum of the current subarray
  -Add it to sums array if the sum is >= integer

-Return the combination with the least amount of integers.

  -Sort the subarrays by size
  -Return the size of the smallest subarray

=end

def subarrays(arr)
  subarrays = []
  (0...arr.size).each do |st_idx|
    (st_idx...arr.size).each do |end_idx|
      subarrays << arr[st_idx..end_idx]
    end
  end
  subarrays
end

def minSubLength(arr, target)
  subarrays = subarrays(arr)
  sums = []
  subarrays.each do |subarr|
    sum = subarr.sum
    sums << subarr if sum >= target
  end
  return 0 if sums.empty?
  sums.sort_by { |subarr| subarr.size }[0].size
end

p minSubLength([2, 3, 1, 2, 4, 3], 7) == 2
 p minSubLength([1, 10, 5, 2, 7], 9) == 1
 p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
 p minSubLength([1, 2, 4], 8) == 0


=begin

The number 1035 is the smallest integer that exhibits a non frequent property: one its multiples, 3105 = 1035 * 3, has its same digits but in different order, in other words, 3105, is one of the permutations of 1035.

The number 125874 is the first integer that has this property when the multiplier is 2, thus: 125874 * 2 = 251748

Make the function search_perm_mult(), that receives an upper bound, n_max and a factor k and will output the amount of pairs bellow n_max that are permuted when an integer of this range is multiplied by k. The pair will be counted if the multiple is less than n_max, too

Let'see some cases:

search_perm_mult(10000, 7) === 1 # because we have the pair 1359, 9513
search_perm_mult(5000, 7) === 0 # no pairs found, as 9513 > 5000

search_perm_mult(10000, 4) === 2 # we have two pairs (1782, 7128) and (2178, 8712)
search_perm_mult(8000, 4) === 1 # only the pair (1782, 7128)

search_perm_mult(5000, 3) === 1 # only the pair (1035, 3105)
search_perm_mult(10000, 3) === 2 # found pairs (1035, 3105) and (2475, 7425)

Features of the random Tests:

10000 <= n_max <= 100000
3 <= k <= 7

=end

=begin
*PROBLEM*
Explicit Rules:
-INPUT: Integer (max number), Integer (factor)
-
-OUTPUT: Integer (number of pairs)

*ALGORITHM*
-Initialize pairs variable to 0
-Initialize current_num variable
-Multiply each number from 1 up to the max number by the second argument (factor)
  -Set sorted digits of num to current_num
  -Compare the sorted digits of current num with the `current_num` variable
  -If they are equal increment pairs by 1




=end

def search_permMult(max_num, factor)
  pairs = 0
  previous_num = 1
  (1..max_num).each do |num|
    current_num = (num * factor).to_s # 1 * 7 = 7
    break if current_num.to_i > max_num
    if previous_num.to_s.chars.sort == current_num.chars.sort # 1 != 7
      pairs += 1
    end
    previous_num += 1
  end
  pairs
end


def search_permMult(max_num, factor)
  num = 1
  pairs = 0

  while num * factor < max_num
    num_string = num.to_s
    multiplied_number_string = (num * factor).to_s

    if num_string.chars.sort == multiplied_number_string.chars.sort
      pairs += 1
    end
    num += 1
  end
  pairs
end

p search_permMult(10000, 7) == 1
 p search_permMult(5000, 7) == 0
 p search_permMult(10000, 4) == 2
p search_permMult(8000, 4) == 1
p search_permMult(5000, 3) == 1
p search_permMult(10000, 3) == 2


=begin
# Given a string s, reverse the string according to the following rules:

# - All the characters that are not English letters remain in the same position.
# - All the English letters (lowercase or uppercase) should be reversed.
# - Return s after reversing it.

Input: String
Output: String
Rules:
Reverse alpha letters a-z
All other chars remain in the same spot

DS:
Array
Hash

Algo:
-Initialize a hash for non alpha chars
-Intialize an empty string for alpha chars
-Iterate through input string
  -If not an alpha char, store in a hash with index as key and char as value
  -Else store the alpha char in a string
-Reverse the alpha chars string

-Insert the stored non alpha chars back into the string
  -Iterate through the hash and insert each char into the reversed string at its original index

-Return the reversed string
=end

def reverse_only_letters(input_str)
  alpha = ('a'..'z').to_a + ('A'..'Z').to_a
  non_alpha_chars = {}
  alpha_str = ''

  str_chars = input_str.chars

  str_chars.each_with_index do |char, idx|
    if alpha.include?(char)
      alpha_str << char
    else
      non_alpha_chars[idx] = char
    end
  end

  reversed_str = alpha_str.reverse

  non_alpha_chars.each do |idx, char|
    reversed_str.insert(idx, char)
  end

  reversed_str
end

# p reverse_only_letters("ab-cd") == "dc-ba"
# p reverse_only_letters("Test1ng-Leet=code-Q!") == "Qedo1ct-eeLg=ntse-T!"
# p reverse_only_letters("--__123") == "--__123"
# p reverse_only_letters('hellO') == 'Olleh'


=begin
# Find the longest substring in alphabetical order.
# Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".
# The input will only consist of lowercase characters and will be at least one letter long.
# If there are multiple solutions, return the one that appears first.

Input: String
Output: String
Rules:
Only lowercase chars
Input will be at least one char long
If there are multiple substrings, return the one that comes first

DS:
Array

Algorithm:
-Initialize a alpha substrings variable to hold alpha substrings
-Initialize an empty string that will hold the current substring
-Iterate through the chars of the Input
  -Add each char to the empty string
  -If the empty string is not equal to itself sorted alphabetically
    -Add the current substring to the alpha substrings
    -Reset it to an empty string
-Return the longest alpha substring
=end

def longest(str)
  alpha_subs = []
  current_sub = [] # na

  str.chars.each do |char|
    current_sub << char
    if current_sub == current_sub.sort
      alpha_subs << current_sub.join
    else
      current_sub = []
      current_sub << char
    end
  end

  alpha_subs.max_by(&:size)
end

p longest('asd') == 'as'
p longest('nab') == 'ab'
p longest('abcdeapbcdef') ==  'abcde'
p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'
p longest('asdfbyfgiklag') == 'fgikl'
p longest('z') == 'z'
p longest('zyba') == 'z'


#====================================================ORIGINAL

=begin
I: Str
O: Str

Algo:
1. Find all substrings
     Substring helper method:
    -Initialize substrings variable []
    -Iterate over 0...input.size - start index
    -Iterate over start index...input.size - end index
    -Add input[start index..end index] to the substrings
    -Return all substrings

2. Check if each substring is in alpha order
     Main method:
    -Initialize alpha substrings vari []
    -Get all substrings from substring helper method
    -Iterate over substrings
    -Check if each substring is equal to itself sorted alphabetically
    -If it is, add it to alpha substrings vari

3. Return the longets substring that is in alpha order
    -Return the largest size substring in alpha substrings vari.
=end

# def substrings(str)
#   subs = []
#   (0...str.size).each do |st|
#     (st...str.size).each do |last|
#       subs << str[st..last]
#     end
#   end
#   subs
# end

# def longest(str)
#   subs = substrings(str)
#   alphasubs = []
#   subs.each do |substr|
#     alphasubs << substr if substr.chars == substr.chars.sort
#   end
#   alphasubs.max_by(&:size)
# end

