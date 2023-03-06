=begin
Requirements:
-Given a list of integers.
-Find minumum number to be inserted in a list, so that sum of all eelments of list should equal the closest prime number.
-List size is at least 2.
-Lists numbers will only be positive.
-Repititions may occur.
-The newer lists sum should equal the cloest prime number.

Algorithm:
-Initialize a starting_sum variable set to the sum of the array argument.
-Initialize a target_sum variable set to 0
-Increment the target_sum variable to the value of starting_sum plus 1 until target_sum is a prime number.
Prime number? helper method:
-Iterate through a range of 2 up to the target_sum minus 1.
-On each iteration, return false if the current number divided by itself is equal to 0.
-Otherwise return true.

-Return the difference of starting_sum and target_sum
=end

def prime_number?(number)
  (2..number-1).each { |num| return false if number % num == 0 }
end

def minimum_number(array)
  target_sum = array.sum
  target_sum += 1 until prime_number?(target_sum)
  target_sum - array.sum
end

# p minimum_number([3, 1, 2])
# p minimum_number([2, 12, 8, 4, 6])

#---------------------------------------------------------------------------

=begin
Requirements:
-Given an array of integers.
-Take the array and find an index where the sum of the integers to the left of the index is equal to the sum of the integers to the right of the index.
-If there is no index that would make this happen, return -1.

Input: Array
Output: Integer

Algorithm:
-Iterate through the array argument.
-On each iteration:
-Calculate the sum of the integers at the range of 0 up to the current index and set it to a left_sum variable.
-Calculate the sum of the integers at the range of the current index up to -1 (the last index) and set it to a right_sum variable.
-Return true if the left sum is equal to the right sum.
-Else Return -1
=end

def find_even_index(array)
  array.each_with_index do |num, index|
    left_sum = array[0..index].sum
    right_sum = array[index..-1].sum
    return index if left_sum == right_sum
  end
  -1
end

# p find_even_index([1,2,3,4,3,2,1])
#----------------------------------------------------------------------------

=begin
Requirements:
-Given an array of integers.
-Find the one that ppears an odd number of times.
-There will always be only one integer that appears an odd number of times.

Input: Array
Output: Integer

Algorithm:
-Iterate through the array argument.
-On each iteration, check if the count of the current number in the array argument is an odd number.
-Return the number if it is.
=end

def find_it(array)
  array.each { |num| return num if array.count(num).odd? }
end
#-----------------------------------------------------------------------------

=begin
Requirements:
-Return the sum of all the multiples of 3 or 5 below the number passed in.
-If the number is negative, return 0.
-If the number is a multiple of both 3 and 5 only count it once.

Input: Integer
Output: Integer

Examples:
10 == 23
Numbers below 10 that are multiples of 3 and 5: 3, 5, 6, 9.  Sum is 23.

Algorithm:
-Initialize a sum variable to 0.
-Iterate over a range of 0 up to but not including the integer argument.
-On each iteration, check if the current number is a multiple of 3 and 5
-If it is, increment the sum variable by the current number
-Else if its a multiple of 5, increment the sum variable by the current number.
-Else if its a multiple of 3, increment the sum variable by the current number.
-Return the sum variable.
=end

def solution(number)
  sum = 0
  (0...number).each do |num|
    sum += num if num % 5 == 0 || num % 3 == 0
  end
  sum
end

# p solution(10)
# p solution(20)
#---------------------------------------------------------------
=begin
Requirements:
-Given two arrays, 'a' and 'b'.
-Write a function that checks whether the two arrays have the same elements, with the same multiplicities.
-The elements of 'b' are the elements in 'a' squared, regardless of the order.

Input: Two arrays
Output: Boolean

Examples:
a = [121, 144, 19, 161, 19, 144, 19, 11]
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

11*11 is 121, 19*19 is 361, and so on.
If a number in 'b' is not a square of a number in 'a', the arrays are not the "same".

Algorithm:
-Iterate over the first array argument.
-On each iteration, check if the current number times itself is included in the second array argument.
-Return true if this is true for all iterations.
-Else return false.
=end

def same?(array1, array2)
  array1.all? do |num|
    array1.count(num) == array2.count(num * num)
  end
end

#p same?([121, 144, 19, 161, 19, 144, 19, 11], [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19])
#==================================================================================
=begin
Requirements:
-Given a list of integers and a single sum value.
-Return the first two values ( from left to right ) in order of appearance that add up to form the sum.
-If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

Input: Array, Integer
Output: Array of 2 integers

Examples:
sum_pairs([11, 3, 7, 5], 10) - the elements 3 and 7 equals the integer argument.
sum_pairs([4,3,2,3,4], 6) - return [4, 2] because they appear before 3 and 3 even though they both equal 6.

Algorithm:
-Iterate over a range of 0 up to but not including the size of the array argument, this will act as the current index for the first element.
-On each iteration:
-Iterate over a range of 1 up to the size of the array argument, this will act as the current index for the second element.
-If the sum of the two elements is equal to the integer argument, return a 2 element array containing the two elements.
-Else return nil.
=end

def sum_pairs(array, integer)

  (0...array.size).each do |num1_idx|
    (1...array.size).each do |num2_idx|

      num1 = array[num1_idx]
      num2 = array[num2_idx]
      return [num1, num2] if num1 + num2 == integer && array.index(num1) < array.index(num2)

    end
  end

end

# def sum_pairs(numbers, sum)
#   last_index = numbers.length - 1 # last element of array               5
#   winning_pair = nil

#   numbers.each.with_index do |n, i|
#     break if i >= last_index

# # now, find the matching pairs.  Rather than iterate again, use
# # `index` which will either return an index if there is a match,
# # or `nil`.  Another optimization is to minimize the size of the
# # array we need to find the pair in, by starting after the index
# # of the first pair, and not going any further than the last pair's
# # index
#     offset = i + 1 # looking at the index after the current one
#     pair = numbers[offset..last_index].index(sum - n) # searching in the array [1, 7, 3, 4, 5], i = 1, [7, 3, 4, 5], target is 10, current number is 7, search index for value of 3

#     next if pair.nil?
#     pair += offset # 2 + 1 =3

#     if pair <= last_index
#       winning_pair = [n, numbers[pair]]
#       last_index = pair
#     end
#   end

#   winning_pair
# end
# p sum_pairs([1, 4, 8, 7, 3, 15], 8)
# p sum_pairs([10, 5, 2, 3, 7, 5], 10)
# p sum_pairs([1,2,3,4,1,0], 2)

#--------------------------------------------------------------------------------

=begin
Requirements:
-Write the group_and_count method which should receive an array and return a hash.abs
-Empty or nil input must return nil instead of a hash.
-This hash returned must contain the unique values of the array as keys, and the values the count of each value.

Input: Array
Output: Hash

DS:
-Hash

Algo:
-Return nil if the array argument is empty or nil.
-Initialize a hash variable to en empty hash.
-Iterate over the array argument.
-On each iteration, set the current number as the key with a value of 1.
-Increment the value by 1 if the current key already exists.
-Return teh hash.
=end

def group_and_count(array)
  return nil if array.empty? || array == nil
  hash = {}
  array.each { |num| hash.keys.include?(num) ? hash[num] += 1 : hash[num] = 1 }
  hash
end

# p group_and_count([1,1,2,2,2,3])

#----------------------------------------------------------------------------------

=begin
Requirements:
-Write a function 'weirdcase' that accepts a string.
-Return the same string with all even indexed characters in each word upper cased and all odd indexed characters in each word lower cased.
-The indexing is 0 based so the 0 index is even, therefore that character should be upcased.
-The passed in string will only consist of alphabet characters and spaces. Spaces will only be present if there ar emultiple words. words will be separated by a single space.

Examples:
weirdcase("String") == "StRiNg"
weirdcase("Weird string case") == "WeIrD StRiNg CaSe"

DS:
Input: String
Output: String

Algo:
-Split the input string into an array of words (separated at spaces).
-Iterate through the words array.
-On each iteration:
-Iterate through the characters and index of the current word.
-If the current index is even, uppercase the current character.
-Else lowercase the current character.
-Join and return the array of words as a string.
=end

def weirdcase(string)
  string.split.map do |word|
    word.chars.map.with_index do |char, index|
      index.even? ? char.upcase : char.downcase
    end.join
  end.join(' ')
end

# p weirdcase("String") == "StRiNg"
# p weirdcase("Weird string case") == "WeIrD StRiNg CaSe"

#_---------------------------------------------------------------
=begin
Requirements:
-Given an array of numbers.
-For each number, find out how many numbers in the array are smaller than it.
-When counting numbers, only count unique values. That is, if a given number occurs multiple times in teh array, it should only be counted once.

Examples:
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
1st iteration: 8 - 3 uniq numbers are smaller
2nd iteration: 1 - 0 uniq numbers are smaller
3rd iteration: 2 - 1 uniq numbers are smaller
and so on.

DS:
-Input: Array
-Intermediate: Array
-Output: Array

Algorithm:
-Initialize a new_array variable to an empty array
-Iterate over the array argument.
-On each iteration:
-Find the count of unique numbers in the array argument that are less than the current number.
-Add the result to the new_array variable.
-Return the new_array variable.
=end

def smaller_numbers_than_current(array)
  new_array = []
  array.each do |num|
    new_array << array.uniq.count { |n| n < num }
  end
  new_array
end

# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]
#--------------------------------------------------------------------------------------------------
=begin
Requirements:
-Write a method that takes one argumnet, an array of integers.
-The method should return the minimum sum of 5 consecutive numbers in the array.
-If the array contains fewer than 5 elements, the method should return nil.

Examples:
p minimum_sum([1, 2, 3, 4]) == nil ---------- Less than 5 elements
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15 ------First 5 equals 15 (minimum sum)
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
1st it - 69
2nd it - 16
3rd it - 23
4rd it -
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10

DS:
-Input: Array
-Intermediate: Array
-Output: Integer

Algorithm:
-Return nil if array size is less than 5
-Initialize a sums variable set to an empty array.
-Iterate over the input Array
-On each iteration find the sum of the numbers in the range of the current index to the current index plus 4. Add each sum to the sums variable.
-Return the smallest value of the sums variable.
=end

def minimum_sum(array)
  return nil if array.size < 5
  sums = []
  array.each_with_index do |num, index|
    current_array = array[index..index+4]
    sums << current_array.sum if current_array.size == 5
  end
  sums.min
end


# p minimum_sum([1, 2, 3, 4]) == nil
# p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
# p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
# p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10
#===========================================================================================================
=begin
Requirements:
-Write a method named to_weird_case that accepts a string.
-Return the same sequence of characters with every 2nd character in every third word converted to uppercase.
-Other characters should remain the same.

DS:
-Input: String
-Intermediate: Array
-Output: String

Algorithm:
-Initialize a counter variable to 2 which will be incremented by 3 on each iteration. This will represent every third word in the string.
-Split the string argument into an array of words and iterate over the array of words and indexes.
-On each iteration:
-If the current index is equal to the counter:
-  Increment the counter by 3 and -
-  Iterate over the characters of the current word and its indexes:
-    If the index is odd (representing every 2nd character), upcase the current character, else leave it as is.

-Join and return the new string.
=end

# def upcase_every_2nd(string)
#   string.chars.map.with_index do |char, char_idx|
#     char_idx.odd? ? char.upcase : char
#   end.join
# end

def to_weird_case(string)
  counter = 2
  string.split.map.with_index do |word, word_idx|
    if word_idx == counter
      counter += 3
      upcase_every_2nd(word)
    else
      word
    end
  end.join(' ')
end

# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# p to_weird_case(
#   'It is a long established fact that a reader will be distracted') ==
#   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# p to_weird_case('aaA bB c') == 'aaA bB c'
# p to_weird_case(
#   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
#   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'
#==================================================================================
=begin
Requirements:
-Given a string.
-Count the lowercase letters.
-Return the letter count in a hash with 'letter' as key and count as 'value'.
-The key must be a symbol instead of a string.

DS:
Input: String
Output: Hash

Algorithm:
-Initialize a hash variable to an empty hash.
-Initialize a characters variable set to an array of characaters of the input string.
-Iterate through the characters.
-On each iteration, if the current character is lowercase, add it to the hash with the current character as a symbol, and the value as the count of the current character in the characters variable.
=end

def letter_count(string)
  hash = {}
  chars = string.chars
  chars.each do |char|
    hash[char.to_sym] = chars.count(char) if char.downcase == char
  end
  hash
end

# p letter_count('codewars') == {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}
# p letter_count('activity') == {:a=>1, :c=>1, :i=>2, :t=>2, :v=>1, :y=>1}
# p letter_count('arithmetics') == {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}
#=========================================================================
=begin
Requirements:
-Given an array of integers.
-Count all pairs in that array and return their count.
-If there are more pairs of a certain number count each pair only once.

DS:
Input: Array
Intermediate: Hash
Output: Integer

Algorithm:
-Initialize a pairs variable set to 0.
-Initialize a hash variable to an empty hash.
-Iterate over the input array.
-On each iteration, set the current number as the key and the count of the current number in the input array as the value.
-Iterate through the values of the hash.
-On each iteration, divide the value by 2 and increment the pairs variable by the value.
-Return the pairs variable.
=end

def pairs(array)
  pairs = 0
  hash = {}
  array.each do |num|
    hash[num] = array.count(num)
  end
  hash.each do |_, value|
    pairs += (value / 2)
  end
  pairs
end

# p pairs([1, 2, 5, 6, 5, 2]) == 2
# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
# p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
# p pairs([1000, 1000]) == 1
# p pairs([]) == 0
# p pairs([54]) == 0
#=====================================================================
=begin
Requirements:
-Return the numbe rof times the search_text is found within the full_text.

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Find all substrings of the full_text:
-Initialize a substrings variable.
-Iterate over a range of 0 up to but not including the size of the input string. This will act as the starting index.
-Iterate over a range of the starting index up to but not including the size of the input string.  THis will act as the end index.
-On each iteration add the input string at the range of the start index to the end index to the substrings variable.

-Return the count of how many times the search_text appears in the substrings variable.
=end

def solution(full_text, search_text)
  count = 0

  (0...full_text.size).each do |st_idx|
    (st_idx...full_text.size).each do |end_idx|
      count += 1 if full_text[st_idx..end_idx] == search_text
    end
  end

  count
end
# p solution('abcdeb','b') #== 2
# p solution('abcdeb', 'a') #== 1
# p solution('abbc', 'bb') #== 1
#====================================================================
=begin
Requirements:
-Given an array of words.
-Return an array of the number of letters that occupy their positions in their alphabet for each word.

Examples:
solve(["abode","ABc","xyzD"]) = [4, 3, 1]
"abode" - ab de occupy their positions in the alphabet
"ABc" - ABC occupy their positions
"xyzD" - D occupy their position.

DS:
Input: Array
Intermediate:
Output: Array

Algorithm:
-Initialize a alphabet variable set to an array of letters in the alphabet.
-Iterate through the array of words. On each iteration:
-Iterate through the characters and indicies of each word.
-Return how many times each downcased character appears in the alphabet variable at the current index.
=end

def solve(array)
  alphabet = ('a'..'z').to_a

  array.map do |word|
    word.chars.select.with_index do |char, index|
        alphabet[index] == (char.downcase)
    end.size
  end
end

# p solve(["abode","ABc","xyzD"]) #= [4, 3, 1]
#=======================================================================
=begin
Requirements:
-Given a lowercase string that has alphabet characters only.
-Return the length of the longest vowel substring.
-Vowels are aeiou.

Examples:
solve("codewarriors") == 2 - longest substring containing only vowels is io (length of 2)

DS:
Input: String
Intermediate: Array
Output: Integer

Algorithm:
-All vowels helper method:
-Initialize a vowels variable to the string 'aeiou'
-Iterate over the input string and return true if all characters are included in the vowels variable.

-Find all substrings of the input string:
-Initialize a substrings variable set to an empty array.
-Iterate over a range of 0 up to but not including the size of the input string. This will act as the start index. On each iteration:
-Iterate over a range of the start index up to but not including the size of the input string. This will act as the end index. On each iteration:
-Initialize a current_string variable set to the string at the index range of start index to end index.
-Invoke the all vowels? method on the current_string.
-If all vowels? returns true, add the current string to the substrings variable.

-Return the length of the longest value of the substrings variable.
=end

def all_vowels?(string)
  vowels = 'aeiou'
  string.chars.all? { |char| vowels.include?(char) }
end

def solve(string)
  substrings = []

  (0...string.size).each do |start_index|
    (start_index...string.size).each do |end_index|
      current_string = string[start_index..end_index]
      substrings << current_string
    end
  end

  substrings
end

# p solve("codewarriors")
#=====================================================================
=begin
Requirements:
-Given an array of words.
-Concatenate the nth letter from each word to construct a new word which should be returned as a string where n is the position of the word in the list.

Examples:
nth_char(['yoda', 'best', 'has'])

DS:
-Input: Array
-Output: String

Algorithm:
-Initialize a new_string variable set to an empty string.
-Iterate through the characters and indices of the input string.
-On each iteration, add the input string character at the current index to the new_string variable.
-Return the new_string variable.
=end

def nth_char(words)
  words.map.with_index { |word, index| word[index] }.join
end
#p nth_char(['yoda', 'best', 'has'])
#======================================================================
=begin
Requirements:
-Given a string.
-Find a minimum substring and the maximum number of times the substring can be repeated until it is equal to the input string.

Examples:
"ababab" - "ab" is repeated 3 times to equal the input string.

DS:
Input: String
Output: Array [String, Integer]

Algorithm:
-Find all substrings of the input string:
-Initialize a substrings variable.
-Iterate over a range of 0 up to but not including the size of the input string. This will act as the start index. On each iteration:
-Iterate over a range of the start index up to but not including the size of the input string. This will act as the end index. On each iteration:
-Add the input string at the index range of the start index to the end index, to the substrings variable.

-Iterate over the array of substrings.
-On each iteration add the current substring to itself until its greater than or equal to the size of the input string.
-If it equals the input string return the substring and how many times it was concatenated.
=end

def substrings(string)
  substrings = []
  (0...string.size).each do |start_index|
    (start_index...string.size).each do |end_index|
      substrings << string[start_index..end_index]
    end
  end
  substrings
end

def repeated_substrings(string)
  substrings = substrings(string)
  substrings.each do |str|
    current_str = ''
    counter = 0
    until current_str.size >= string.size
      current_str << str
      counter += 1
      return [str, counter] if current_str == string
    end
  end
end


def f(string)
  (0...string.size).each do |end_index|
    substr = string[0..end_index]
    multiplier = string.size / substr.size
    return [substr, multiplier] if substr * multiplier == string
  end
end

# p f("ababab")
# p f("abcde")
#=======================================================================
=begin
Requirements:
-Return a string where:
-The first and last characters remain in original place for each word.
-Characters between the first and last characters must be sorted alphabetically.
-Punctuation shoudl remain at the same place as it started.

DS:
-Input: String
-Output: String

Algorithm:
-Initialize an alphabet variable to an array of the letters in the alphabet.
-Initialize a first char and last char variables set to empty strings.
-Initialize a characters variable set to an array of characters of the input string.
-Remove the first character of the characters variable and add it to the first_char variable until the first_char variable includes a letter from the alphabet variable.
-Remove the last character of the characters variable and prepend it to the last_char variable until the last_char variable includes a letter from the alphabet variable.
-Sort the characters variable by alphabetic order.
-Return the first char plus characters plus last char variables.
=end

def alphabetic_char?(string)
  ('a'..'z').each { |letter| return true if string.include?(letter) }
  false
end

def scramble_words(words)
  characters = words.chars
  first_chars = ''
  last_chars = ''
  first_chars << characters.shift until alphabetic_char?(first_chars)
  last_chars.prepend(characters.pop) until alphabetic_char?(last_chars)
  characters.join
end

# p scramble_words('-dcba')
# p scramble_words('professionals')


  # Test.assert_equals(scramble_words('professionals'), 'paefilnoorsss', 'The first and last letters of a word should reamin in place with the inner letters sorted')
  # Test.assert_equals(scramble_words('i'), 'i', 'Must handle single charater words')
  # Test.assert_equals(scramble_words(''), '', 'Must handle empty strings')
  # Test.assert_equals(scramble_words('me'), 'me', 'Must handle 2 charater words')
  # Test.assert_equals(scramble_words('you'), 'you', 'Must handle 3 charater words')
  # Test.assert_equals(scramble_words('card-carrying'), 'caac-dinrrryg', 'Only spaces separate words and punctuation should remain at the same place as it started')
  # Test.assert_equals(scramble_words("shan't"), "sahn't", 'Punctuation should remain at the same place as it started')
# p scramble_words('-dcba') == '-dbca'
# p scramble_words('dcba.') == 'dbca.'
#p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") #== "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."

def alphabetic_char?(string)
  ('a'..'z').each { |letter| return true if string.include?(letter) }
  false
end

def scramble_words(words)
  alphabet = 'abcdefghijklmnopqrstuvwxyz'
  words.split.map do |word|
    characters = word.chars
  first_chars = ''
  last_chars = ''
  first_chars << characters.shift until alphabetic_char?(first_chars)
  last_chars.prepend(characters.pop) until alphabetic_char?(last_chars)

  characters.sort_by! do |char|
    alphabet.include?(char)

      p "char: #{char}"

  end


  first_chars + characters.join + last_chars

  end
end
#==================================================================================
=begin
Requirements:
-Write a function that, given an array of text, returns an array of the top 3 most occurring words. in descending order of the number of occurrences.
-A word is a string of letters a-z.
-Matches should be case-insensitive and the words in the result should be lowercased.
-If a text contains fewer than three unique words, either the top 2 or top 1 words hsould be returned, or an empty array if a text contains no words.

Examples:
top_3_words("a a a  b  c c  d d d d  e e e e e") == ["e", "d", "a"] "e" appears 5 times, "d" appears 4 times, "a" appears 3 times. Return the top 3 values.

DS:
-Input: String
-Intermediate: Hash
-Output: Array

Algorithm:
-Initialize a hash variable to an empty hash.
-Split the input string into an array of words.
-Iterate over the array of words and on each iteration:
-Add the current word to the hash variable as the key and the count of the current word in the array of words, as the value.
-Sort the hash by values.
-Return an array of the 3 highest values.
=end

def alphabetic?(string)
  alphabet = "abcdefghijklmnopqrstuvwxyz'".chars
  string.chars.any? { |char| alphabet.include?(char) }
end

# #p alphabetic?("...")

def top_3_words(string)
  return [] unless alphabetic?(string)
  hash = {}
  words = string.split
  words.each do |word|
    hash[word] = words.count(word)
  end
  values = hash.values.max(3)
  values.map do |value|
    hash.key(value)
  end
end

# p top_3_words("a a a  b  c c  d d d d  e e e e e") #== ["e", "d", "a"]
#==================================================================================================================
=begin
Requirements:
-Modify kebabize function that it converts a camel case string int oa kebab case.

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Iterate through the chars and indices of the input string.
-On each iteration, check if the current character is uppercase.
-If it is, lowercase it and insert a '-' at the previous index.
-Join the chars back into a string and return it.
=end

def kebabize(string)
  chars = string.chars.select { |char| ('a'..'z').include?(char.downcase) }
  chars.each_with_index do |char, index|
    if char == char.upcase
      char.downcase!
      chars.insert(index, '-') unless index == 0
    end
  end
  chars.join
end

# p kebabize('myCamelCasedString')
# p kebabize('myCamelHas3Humps')
#=================================================================================================================
=begin
16. Stop gninnipS My sdroW!
(https://www.codewars.com/kata/5264d2b162488dc400000001)
6 kyu
Write a function that takes in a string of one or more words, and returns the same string, but with all words with five or more letters five or more letter words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Examples: spinWords( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"
=end



=begin
Requirements:
-Write a method that takes in a string of one or more words.
-Return the same string but with all words with five or more letters reversed.
-String passed in will consist of only letters and spaces. Spaces will be included only when more than one word is present.

Algorithm:
-Split the input string into an array of words.
-Iterate over the array of words. On each iteration:
-Check if the current word size is greater than 5.
-If it is, reverse the word, else leave it alone.
-Join the array of words back into a string and return it.
=end

def spinWords(string)
  string.split.map! { |word| word.size > 5 ? word.reverse : word }.join(' ')
end

# p spinWords("Hey fellow warriors") #== "Hey wollef sroirraw"
# p spinWords("This is a test") #== "This is a test"
# p spinWords("This is another test") #== "This is rehtona test"
#===============================================================================================================
=begin
Requirements:
-Write a function, persistence, that takes in a positive number
-Returns its multiplicivate persistence, which is the number of times you must multiply the digits in num until you reach a single digit.

Examples:
-persistence(39) == 3
3 * 9 = 27
2 * 7 = 14
1 * 4 = 4 - It took 3 times to reach a single digit result.

-persistence(999) == 4
9 * 9 * 9 = 729
7 * 2 * 9 = 126
1 * 2 * 6 = 12
1 * 2 = 2 - It took 4 times to reach a single digit result

DS:
-Input: Integer
-Output: Integer

Algorithm:
-Initialize a counter variable set to 0.
-Initialize a digits variable to an array of digits of the input integer.
-Find the product of the digits variable.
-Increment the counter variable by 1.
-Continue until the size of the digits array is 1.
-Return the value of counter.
=end
def persistence(num)
  counter = 0
  start_num = num.to_s.split

  until start_num.join.to_i.digits.size == 1
    start_num = start_num.map { |num| num.to_i.digits.inject(:*) }
    counter += 1
  end

  counter
end
def persistence(num)
  counter = 0
  start_num = num.digits

  until start_num.size == 1
    start_num = start_num.inject(:*).digits
    counter += 1
  end

  counter
end

# p persistence(999)
#============================================================================================================
=begin
Requirements:
-Write a function that will convert a string into title case, given an optional list of exceptions(minor words)
-The list of minor words will be given as a string with each word seprated by a space.
-Your function should ignore the case of the minor words string - it should behave in the same way even if the case of the minor word string is changed.
-A string is considered to be in title case if each word in the string is either capitalized, or considered to be an exception and put entirely into lowr case unlesss it is the first word which is always capitalized.
-The first argument is the original string ot be converted.
-The second optional argument is a list of words that must be lowercase except for the first word in the string.

Examples:
title_case('a clash of KINGS', 'a an the of') # should return: 'A Clash of Kings'
A is an exception but still capitalized since its the first word.
Clash is capitalized, not an exception.
of stays lowercase because it is an exception.
Only the first letter of Kings is capitalized.

title_case('THE WIND IN THE WILLOWS', 'The In') # should return: 'The Wind in the Willows'
The - exception but first word so always capitalized.
Wind - capitalized, not an exception
in - lowercase because it is an exception
the - lowercase because it is an exception.
Willows - capitalized, nota n exception.

title_case('the quick brown fox') # should return: 'The Quick Brown Fox'
No optional argument - each word capitalized.

Algorithm:
-Split the input string into an array of strings(words)
-Iterate over the array of words and indices.
-On each iteration:
-Capitalize the word.
-If the optional argument includes the current word:
-  Downcase it unless the current index is 0.
Join the array of words into a string and return it.
=end
# def match?(string, minor_words = '')
#   minor_words.downcase.split.any? { |word| word == string.downcase }
# end

def title_case(title, minor_words = '')
  words = title.split.map(&:capitalize)

  words.map.with_index do |word, index|
    if match?(word, minor_words)
      index == 0 ? word : word.downcase
    else
      word
    end
  end.join(' ')
end

# p title_case('a clash OF KINGS', 'a an the of') # should return: 'A Clash of Kings'
# p title_case('THE WIND IN THE WILLOWS', 'The In') # should return: 'The Wind in the Willows'
# p title_case('the quick brown fox') # should return: 'The Quick Brown Fox'
#============================================================================================================
=begin
Requirements:
-Write a method that takes a string argumnet and groups the number of times each character appears in the string as a hash sorted by the highest number of occurrences.
-The characters should be sorted alphabetically.
-Ignore spaces special characters adn count uppercase ltters as lowercase ones.

Examples:
p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}
Keys are the the number of occurrences, values are arrays of the alphabetic characters.

p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}
p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}
p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}
p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}

DS:
-Input: String
-Output: Hash

Algorithm:
-Initialize an alphabet variable set to an array of alphabetic characters
-Initialize a occurrences variable to an empty hash.
-Iterate over the characters of the input string. On each iteration:
-If the count of the current character already exists as a hash key, add the current character to the value array.
-If the alphabet variable includes the current character:
-Add the count of the current character to the occurrences hash as a key.
-And set the current character as a value in an array.
=end

def get_char_count(string)
  alphanum = ('a'..'z').to_a + ('0'..'9').to_a
  occurrences = {}
  chars = string.downcase.chars
  chars.each do |char|
    count = chars.count(char)
    if occurrences.keys.include?(count)
      occurrences[count] += [char] if alphanum.include?(char)
    else
      occurrences[count] = [char] if alphanum.include?(char)
    end
  end
  occurrences.transform_values { |array| array.uniq.sort }.sort_by { |key,_| -key }.to_h
end

# p get_char_count("Mississippi") #== {4=>["i", "s"], 2=>["p"], 1=>["m"]}
# p get_char_count("Hello. Hello? HELLO!!") #== {6=>["l"], 3=>["e", "h", "o"]}
# p get_char_count("aaa...bb...c!") #== {3=>["a"], 2=>["b"], 1=>["c"]}
# p get_char_count("aaabbbccc") #== {3=>["a", "b", "c"]}
# p get_char_count("abc123") #== {1=>["1", "2", "3", "a", "b", "c"]}

def triple_double(num1, num2)
  digits1 = num1.to_s
  digits2 = num2.to_s
  digits1.chars.each do |num|
    if digits1.include?(num * 3) && digits2.include?(num * 2)
      return 1
    end

  end
  0
end

=begin
60. Which are in?
(https://www.codwewars.com/kata/550554fd08b86f84fe000a58)
6 kyu
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

#Example 1: a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

#Example 2: a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []

p substrings(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
p substrings(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []
p substrings(["delta", "gamma", "alpha", "beta"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == ["alpha", "beta", "gamma"]
p substrings(["albe", "negam"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == []
Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.

In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.

Beware: r must be without duplicates.
Don't mutate the inputs.
=end

=begin
Requirements:
-Given two arrays of strings a1 and a2, return a sorted array in order of the strings of a1 which are substrings of a2.

Examples:
#Example 1: a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

#Example 2: a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []


DS:
Input: Two arrays
Output: Array

Algorithm:

-Initialize a matches variable to en empty array.
-Iterate over the strings of the second array argument
-On each iteration: iterate over each element of the first array argument.
-If the current element of the second array includes the current element of the first array:
-Add the current element of the first array to the matches variable.
-Sort the matches variable by alphabetic order and return it.
=end


def substrings(arr1, arr2)
  matches = []
  arr2.each do |arr2_word|
    arr1.each do |arr1_word|
      matches << arr1_word if arr2_word.include?(arr1_word)
    end
  end
  matches.uniq.sort
end

# p substrings(["arp", "live", "strong"], ["lively", "alive", "harp", "sharp", "armstrong"]) == ["arp", "live", "strong"]
# p substrings(["tarp", "mice", "bull"], ["lively", "alive", "harp", "sharp", "armstrong"]) == []
# p substrings(["delta", "gamma", "alpha", "beta"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == ["alpha", "beta", "gamma"]
# p substrings(["albe", "negam"], ["alphabetical", "beta-carotene", "gamma rays", "deltoid"]) == []

=begin
63. Who likes it?
(https://www.codewars.com/kata/5266876b8f4bf2da9b000362)
6 kyu
You probably know the "like" system from Facebook and other pages. People can "like" blog posts, pictures or other items. We want to create the text that should be displayed next to such an item.

Implement a function likes :: [String] -> String, which must take in input array, containing the names of people who like an item. It must return the display text as shown in the examples:

likes [] // must be "no one likes this"
likes ["Peter"] // must be "Peter likes this"
likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"
=end

=begin
Requirements:
-
DS:
Input: Array
Output: String

Algorithm:
-Return the string "no one likes this" if the array argument is empty.
-Return "the array joined with ' and ' like this" if the array size is 2.
-
-

-If the array argument size is more than 3, subtract 2 from the array size, this will act as how many others like this.
=end

def likes(array)
  return "no one likes this" if array.empty?
  return "#{array[0]} likes this" if array.size == 1
  return "#{array[0]} and #{array[1]} like this" if array.size == 2
  return "#{array[0]}, #{array[1]} and #{array[2]} like this" if array.size == 3
  return "#{array[0]}, #{array[1]} and #{array.size - 2} others like this"
end

# p likes([]) == "no one likes this"
# p likes(["Peter"]) == "Peter likes this"
# p likes(["Jacob", "Alex"]) == "Jacob and Alex like this"
# p likes(["Max", "John", "Mark"]) == "Max, John and Mark like this"
# p likes(["Alex", "Jacob", "Mark", "Max"]) #=="Alex, Jacob and 2 others like this"
#==================================================================================
=begin
Requirements:
-Write a function that accepts a 2d array, return the location of the mine.
-The mine is represented as the integer 1 in the 2d array.
-Areas in the 2d array that are not the mine will be represented as 0s.
-The location returned should be an array where the first element is the row index and the second element is the column index of the bomb location.

Examples:
p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
Mine is in the 0 index sub array at the 0 element index

p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
Mine is in the 1 index sub array at the 1 element index.

p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
Mine is in the 2 index sub array at the 1 element index.

DS:
Input: Array of sub arrays.
Output: 2 Element array of integers

Algorithm:
-Iterate over each sub array and its indexes of the input array. Index will be represented by subarr_index.
-On each iteration, iterate over the elements and indexes of the current sub array. Index will be represented as element_index.
-On each iteration, check if the current element is 1.
-If it is, return a 2 element array containing the subarr_index and the element_index.
=end

def mineLocation(array)
  array.each_with_index do |subarr, subarr_idx|
    subarr.each_with_index do |element, element_idx|
      return [subarr_idx, element_idx] if element == 1
    end
  end
end

# p mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) == [0, 0]
# p mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) == [1, 1]
# p mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) == [2, 1]
# p mineLocation([ [1, 0], [0, 0] ]) == [0, 0]
# p mineLocation([ [1, 0, 0], [0, 0, 0], [0, 0, 0] ]) == [0, 0]
# p mineLocation([ [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 1, 0], [0, 0, 0, 0] ]) == [2, 2]
#========================================================================================
=begin
Requirements:
-Find the longest substring in alphabetic order.
-Code will need to be efficient.
-Input will only consist of lowercase characters and will be at least one letter long.
-If there are multiple solutions, return the one that appears first.

DS:
Input: String
Output: String

Algorithm:
-Initialize a substrings variable to an empty array.
-Add the substrings of the input string to the substrings array if they are in alphabetic order.
-Return the longest alphabetic substring.
=end

def substrings(string)
  substrings = []
  (0...string.size).each do |st_idx|
    (st_idx...string.size).each do |end_idx|
      current_substr = string[st_idx..end_idx]
        if current_substr.chars == current_substr.chars.sort
          substrings << current_substr
        end
    end
  end
  substrings
end

def longest(string)
  substrings = substrings(string)
  largest = substrings.map(&:size).max
  substrings.select { |str| str.size == largest }.first
end
p longest('asd')
p longest('abcdeapbcdef')


=begin
Requirements:
-Write a method named to_weird_case that accepts a string.
-Return the same sequence of hcaracters with every 2nd character in every third word converted to upcase.
-Other characters should remain the same.

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Initialize a counter variable to 2 that will act as a pointer to every third word.
-Split the input string into an array of words.
-Iterate over each word and its indices. On each iteration:
-If the index of the current word is equal to the counter variable:
-Iterate over the characters and indices of the current word.
-Increment the counter variable by 3.
-If the index of the current character is even, upcase the character.
-  Else leave it alone.
-Join the characters of the current word back together.
-Join the words back together into a string and return the result.
=end

def to_weird_case(string)
  counter = 2
  string.split.map.with_index do |word, word_index|
    if word_index == counter
      counter += 3
      word.chars.map.with_index do |char, char_index|
        char_index.odd? ? char.upcase : char
      end.join
    else
      word
    end
  end.join(' ')
end


# p to_weird_case('Lorem Ipsum is simply dummy text of the printing') == 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
# # p to_weird_case(
# #   'It is a long established fact that a reader will be distracted') ==
# #   'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
# # p to_weird_case('aaA bB c') == 'aaA bB c'
# # p to_weird_case(
# #   'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
# #   'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

=begin
Requirements:
-Write a method that takes an array of integers and returns the two numbers that are closest together in value.

Examples:
p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

DS:
Input: Array
Output: Array

Algorithm:
-Sort the input array by value
-Iterate over the numbers and index of the input array
-On each iteration, subtract the current number from the number at the current index plus 1
-
=end

=begin
Requirements:
-Write a method that takes a string as an argument.
-Return the character that occurs least often in a given string.
-If there are multiple characters with the equla lower number, return the one that ppears first in the string.
-Consider the uppercase and lowercase version to be the same.

DS:
Input: String
Intermediate: Hash
Output: String

Algorithm:
-Initialize a hash variable to an empty hash.
-Iterate over the characters of the input string.
-On each iteration add the current character to the hash variable as the key and the count of the current character (downcased) in the input string as the value.
-Sort the hash by values and return the key of the lowest value.
=end

def least_common_char(string)
  hash = {}
  string = string.downcase.chars
  string.each do |char|
    hash[char] = string.count(char)
  end
  hash.sort_by { |k, v| v }.to_h.first[0]

end

# p least_common_char("Hello World") == "h"
# p least_common_char("Peter Piper picked a peck of pickled peppers") == "t"
# p least_common_char("Mississippi") == "m"
# p least_common_char("Happy birthday!") == ' '
# p least_common_char("aaaaaAAAA") == 'a'

=begin
=================================================================================
=begin
Requirements:
-Create a hashtag generator.
-It must start with a #
-If the final result is longer than 140 chars it must return false.
-If the input or the result is an empty string it must return false.

Examples:
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
String starts with # and each word is capitalized, all spaces removed.

"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false
Empty string returns false

DS:
Input: String
Output: String

Algorithm:
-Initialize a hashtag variable to the string "#"
-Split the input string into an array of words. Iterate over the array.
-On each iteration:
-Add the current word, capitalized, to the hashtag variable.
-Return false if the input string is empty or if the hashtag variable size is greater than 140.
-Return the hashtag variable.
=end


  def hashtag(string)
    hashtag = ""
    words = string.split
    words.each do |word|
      hashtag << word.capitalize
    end
    return false if string.empty? || hashtag.empty?
    hashtag.insert(0, "#")
    hashtag.size > 140 ? false : hashtag
  end

# p hashtag(" Hello there thanks for trying my Kata") == "#HelloThereThanksForTryingMyKata"
# p hashtag("    Hello     World   ") == "#HelloWorld"
# p hashtag("") ==  false
#=======================================================================================================
=begin
Requirements:
-Write a function cakes.
-Takes the recipe and the available ingredients and returns the maximum number of cakes pete can bake.
-Ingredients not present can be considered as 0.

Examples:
// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200});
First hash arg = recipe
Second hash arg = available ingredients
recipe takes 500 flour, 1200 available. - enough flour for 2
recipe takes 200 sguar, 1200 availabel - enough sugar for 6
recipe takes 1 egg, 5 available - enough eggs for 5

Calculate how many times each ingredient can be made from the available ingredients.
The smallest number is the maximum number of cakes that can be made.

// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});

Recipe takes 3 apples, no apple available so 0 ccakes can be made.

DS:
Input: 2 hashes
Itermediate: Array
Output: Integer

Algorithm:
-Initilaize a cakes variable set to an empty array.
-Iterate over the recipe hash.
-Check if the available ingredients hash includes the current ingredient key.
-If it doesnt, return 0
-If it does, divide the value of the current key in the available ingredients by the value of the current key. Add the result to the cakes variable.
-Return the smallest number of the cakes variable.
=end

def cakes(recipe, available_ingredients)
  cakes = []
  recipe.each do |ingredient, amount|

    if available_ingredients.keys.include?(ingredient)
      cakes << available_ingredients[ingredient] / amount

    else
      return 0
    end
  end
  cakes.min
end

# p cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200})
#=================================================================================================================
=begin
Requirements
-Complete a function that:
-Accepts two integer arrays of equal length.
-Compare the value each member in one array to the corressponding member int he other.
-Squares the absolute value different between those two values.
-Return the average of those squared abs values difference between each member pair.

Examples:
[1, 2, 3], [4, 5, 6]
differce between 1 and 4 = 3, squared is 9
difference between 2 and 5 = 3 squared is 9
difference between 3 and 6 = 3 squared is 9
[9, 9, 9] = average 9

DS:
Input: Two arrays
Intermediate: Array
Output: Integer or float.

Algorithm:
-Initialize a squares variable to an empty array.
-Iterate through the first array argument and its indexes.
-On each iteration find the difference of the current number and the number at the same index in the second array argument.
-Find the absolute value of the difference
-Square the absolute value and add it to teh squares variable.
-Return the average of the squares variable.
=end

def squares(arr1, arr2)
  squares = []
  arr1.each_with_index do |num, index|
    difference = arr2[index] - num
    squares << difference ** 2.0
  end
  squares.sum / squares.size
end

#p squares([1, 2, 3], [4, 5, 6])
#=============================================================================================
=begin
Requirements:
-Create a method called power that takes two integers and retunrs the value of the first argument raised to the power of ht esecond.
-Return nil if the second argument is negative.
-Dont use ** operator.

Examples:
power(2,3) == 2 * 2 * 2
power(10, 0) == 10
power(-5,3) == -5 * -5 * -5 = -125
power(-4, 2) == -4 * -4 = 16
power(5, -1) = Nil

DS:
Input: Two integers
Output: Integer

Algorithm:
-Return nil if second argument is less than 0
-Initiliaze power variable to 1.
-Reassign the power variable to the return of multiplying the first integer argument by itself as many times as the second integer argument indicates.
-Return the power variable.
=end

def power(int1, int2)
  return nil if int2 < 0
  power = 1
int2.times { power *= int1 }
power
end

# p power(2, 3)

#==========================================================================================
=begin
Requirements:
-Write a function that will find all the anagrams of a word from a list. You will be given two inputs, a word and an array with words.
-Return an array of all the anagrams or an empty array if there are none.

Examples:
anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']

DS:
Input: String, Array
Output: Array

Algorithm:
-Initialize an anagrams variable to an empty array.
-Iterate over the second argument (array).
-On each iteration:
-Check if the current word, sorted, is equal to the first string argument (sorted).
-If it is, add the current word to the anagrams variable.
-Return the anagrams variable.
=end

def anagrams(string, array)
  anagrams = []
  array.each do |word|
    anagrams << word if word.chars.sort == string.chars.sort
  end
  anagrams
end

# p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada'])
#===========================================================================================
=begin
Requirements:
-Complete the solution so that it splits the string argument into pairs of two characters.
-If the string contains an odd numbe rof characters then it shouuld replace the missing second character of the final pair with an underscore.

Examples:
solution('abc') => ['ab', 'c_']
solution('abcdef') => ['ab', cd', 'ef']

DS:
Input: String
Output: Array

Algorithm:
-Initialize a split_strings variable to an empty array.
-Initialize a current_str variable to an empty string.
-Iterate over the characters of the input string.
-Add the current character to the current_str variable.
-If the current_str variable size is 2, add it to the split_strings variable and reset the current_str variable to an empty string.

-If the size of the input string is even, return the split_strings variable.
-  Else insert a '_' at the end of the last element in split_strings and return the split_strings variable.
=end

def solution(string)
  split_strings = []
  current_str = ''

  string.chars.each_with_index do |char, index|
    current_str << char
    current_str << '_' if string.size.odd? && index == string.size - 1


    if current_str.size == 2
      split_strings << current_str
      current_str = ''
    end
  end

  split_strings
end

# p solution('abc')
# p solution('abcdef')
#==============================================================================================
=begin
Requirements:
-Given a string of words.
-Find the highest scoring word.
-Each letter of a word scores points according to its position in the alphabet.
-Return the highest scoring word as a string.
-If two words score the same, return the word that appears earliest in the original string.
-All letters will be lowercase and all inputs will be valid.

DS:
Input: String of words
Intermediate: Array
Output: String of 1 word

Algorithm:
-Initialize a points variable to an empty hash.
-Iterate over a range of 'a' to 'z' with index. On each iteration add the current character to the points variable as a key, and the current index plus 1 as the value.

-Split the input string into an array of words.
-Iterate (transform) the array of words. On each iteration:
-Initialize a word_value variable to an empty array.
-Iterate through the characters of the current word.
-Find the current characters key in the points variable hash and add the value to the word_value.
-Return the sum of the word value to the outer map call.
-Return the max value word.
=end

def high(string)
  points = {}
  ('a'..'z').each_with_index { |letter, index| points[letter] = index + 1 }

  words = string.split
  word_values = words.map do |word|
                  word_value = word.chars.map do |char|
                    points[char]
                  end.sum
                end

  words[word_values.index(word_values.max)]
end

# p high('man i need a taxi up to ubud') #== 'taxi'
# p high('what time are we climbing up the volcano') == 'volcano'
# p high('take me to semynak') == 'semynak'
# p high('aaa b') == 'aaa'

#==============================================================================================================
=begin
Requirements:
-Given a String.
-Replace every letter with its position in the alphabet.

Examples:
'a' = 1
'b' = 2
etc.

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Initialize a positions variable to an empty hash.
-Iterate over a range of 'a' to 'z' with indexes. On each iteration set the current letter as a key in the positions variable and the current index plus 1 as the value.

-Initialize an alpha_position variable to an empty array.
-Iterate over the characters of the input string. On each iteration:
-If the keys of the position hash include the current character(downcased)
-  Add the value of the current key to the alpha_position variable.

-Join the alpha_position array together with a space and return the resulting string.
=end

def alphabet_positions(text)
  positions = {}
  ('a'..'z').each_with_index { |letter, index| positions[letter] = index + 1 }

  text.downcase.chars.each_with_object([]) do |char, char_positions|
    char_positions << positions[char] if positions.keys.include?(char)
  end.join(' ')
end

#p alphabet_positions("The sunset sets at twelve o' clock.")
#==========================================================================
=begin
Requirements:
-Given a string that includes alphanmueric characters.
-Return the expansion of that string.
-The numeric values represent the occurrenc eo ceach letter preceding that numeric value.
-There should be no numeric charactesr in the final string.
-The first occurrence of a numeric value should be the number of times each character behind it is repeated until the next numeric value appears.
-If there are mulitple consecutive integers, only the last one should be used, ignore the previous ones.
-Empty strings hsould return an empty string.
-Code should work for both lower and capital case letters.

Examples:
string_expansion("3D2a5d2f")
3 -> "DDD"
2 -> "aa"
5 -> "ddddd"
2 -> "ff"
"DDDaadddddff"

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Initialize a alpha variable to an array of a-z
-Initialize an integer variable to 1 which will be reassigned every time an integer is found in the input string.
-Initialize a new_string variable to an emtpy string.
-Iterate through the characters and indices of the input string.
-If the 'numeric' variable includes the current character, reassign the integer variable to the current character (converted to an integer).
-Else: add the current character to the new_string variable as many times as the integer variable indicates.
-Return the new_string variable.
=end

def string_expansion(string)
  alpha = ('a'..'z').to_a
  new_string = ''
  current_integer = 1

  string.chars.each do |char|
    if alpha.include?(char.downcase)
      new_string << char * current_integer
    else
      current_integer = char.to_i
    end
  end

  new_string
end

# p string_expansion("3D2a5d2f")
#===========================================================================================
=begin
Requirements:
-Given a string.
-return the string in an array where an uppercase letter is a person standing up.
-The input string will always be lower case but maybe empty.
-If the character in ht estring is whitespace then pass over it as if it was an empty seat.

Examples:
wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
index 0 upcased, add word to new array.
index 1 upcased, add word to new array.
index 2 upcased, and so on.

DS:
Input: String
Output: Array

Algorithm:
-Initialize a wave variable to an empty array.
-Iterate over the characters and indexes of the input string.
-On each iteration upcase the input string at the current index and add the result to the wave variable.
-Return the wave variable.
=end

def wave(string)
  # alpha = ('a'..'z').to_a
  # wave =[]
  string.chars.map.with_index do |char, index|
    next if char == ' '
    string[0...index] + string[index..-1].capitalize
  end
end

#p wave("hel lo")
#["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"]
#=================================================================
=begin
Requirements:
-Given an integer n
-Find the maximal number you can obtain by deletingexaclty one digit of the given number.

Examples:
If n = 152, the output should be 52
If n = 1001, the output should be 101

DS:
Input: Integer
Intermediate: Array
Output: Integer

Algorithm:
-Initialize a numbers variable to an empty array.
-Iterate through the digits and indexes of the input Integer (as an array).
-On each iteration, add every number not including the current index to the numbers variable.
-Find the largest number of the numbers variable and return it.
=end

def delete_digit(num)
  del_digits = []
  num_array = num.to_s.chars

  num_array.each_with_index do |number, index|
    del_digits << num_array[0...index] + num_array[index+1..-1]
  end

  del_digits.map { |subarr| subarr.join.to_i }.max
end

# p delete_digit(152)
#+===================================================================================
=begin
Requirements:
-Return the sum of all the mulitples of 3 or 5 BELOW the number passed in.
-If the number is negative, return 0.

Examples:
Given the integer 10:
3, 5, 6, 9 are numbers under 10 that are multiples of 3 or 5, the sum is 23.

DS:
Input: Integer
Intermediate: Array
Output: Integer

Algorithm:
-Intiialize a multiples variable to an empty array.
-Iterate over a range of 0 up to the integer argument minus 1. (up to but not including thhe int argument)
-On each iteration, check if the current number is a multiple of 3 or 5.
-  If it is, add it to the multiples variable.
-Return the sum of the multiples variable.
=end

def solution(number)
  multiples = []

  (0...number).each do |num|
    if num % 3 == 0 || num % 5 == 0
      multiples << num
    end
  end

  multiples.sum
end

# p solution(10)
#===================================================================================
=begin
Requirements:
-Given a string.
-Return a new string that has transformed based on the input:
-Change case of every character (lower to upper, upper to lower).
-Reverse the order of the words from the input.
-You will have to handle multiple spaces and leading trailing spaces.
-Assume the input onlyh contain alphabet and spaces.

Examples:
"Example Input" => "iNPUT eXAMPLE"

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Initialize a new_string variable to an empty array.
-Split the input string into an array of words.
-Iterate over the array of words, on each iteration:
-Iterate (transform) over the characters of the current word, on each iteration:
-Swap the case of the current character.
-Join the characters backtogether.
-Prepend the result of each word transformation to the new_string variable.
-Return the new_string variable as a string.
=end

def string_transformer(string)

  new_string = []

  string.split(/\s/).each do |word|

    swapped_word = word.chars.map do |char|
                      char.swapcase
                    end.join
    new_string.prepend(swapped_word)


                  end
  new_string.join(' ')

end




# p string_transformer("Input            Example")
#===============================================================================================
=begin
Requirements:
-Find the greatest product of five consecutive digits in the given string of digits.

DS:
Input: String
Intermediate: Array
Output: Integer

Algorithm:
-Initialize a products variable to an empty array.
-Convert the digits of the input string into integers.
-Iterate over the array of integers and their indexes.
-On each iteration:
-Initialize a current_product variable and set it to an empty array.
-Add a range of numbers to the current_product variable at the index of the current index plus 4
-Add the product of the current_product variable to the products variable if the current_product variable has 5 elements.
-Return the largest element of the products variable.
=end

def greatest_product(num)
  products = []
  integers = num.chars.map(&:to_i)

integers.each_with_index do |int, idx|
  current_product = integers[idx..idx+4]
  products << current_product.inject(:*) if current_product.size == 5
end

products.max

end

# p greatest_product("12345678954345")
#==================================================================================
=begin
Requirements:
-Convert a string to a new string where each character in the new string is "(" if that character appears only once in the original string, or ")" if that characters appears more than once int he original string.
-Ignore capitalization when determining if a character is a duplicate.

Examples:
"din" => "(((" each char only appears once
"dinner" => "(())((" n appears more than once, both are turned into )

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Initialize a downcased string variable to the input string downcased.
-Iterate over the characters of the downcased string variable.
-On each iteration:
-If the count of the current character in the downcased string variable is 1
-  Transform the current character into (
-Else
-  Transform the current character into )
-Join the characters back into a string and return the result.
=end

def duplicate_encode(string)
  downcased_string = string.downcase

  downcased_string.chars.map do |char|
    if downcased_string.count(char) == 1
      "("
    else
      ")"
    end
  end.join
end

# p duplicate_encode("Success")
#=======================================================================================
=begin
Requirements:
-Assume "#" is like a backspace in string. This means that the string "a#bc#d" actually is "bd".
-Your task is to proecess a string with # symbols.

Examples:
"abc#d##c" -> "ac"

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
-Iterate over the characters and indexes the input string.
-On each iteration, if the current character is #
-Substitute the previous index of the input string with nothing ('').
-Return the input string.
=end

def clean_string(dirty_string)
  clean_string = []
  dirty_string.chars.each do |char|
    if char == '#'
      clean_string.pop
    else
      clean_string << char
    end
    p clean_string
  end

  clean_string
end

# p clean_string('abc#d##c')
# ===========================================================================================
=begin
Requirements:
-Given a list of integers.
-Find the minimum number ot be inserted in a list, so that the sum of all elements of the list should equal the closest prime number.
-LIst size is at least2.
-Lists numbers will only be positive.
-Repitions of numbers could occur.
-The newer list sum shoudl equal the closest prime number.

Examples:
[3, 1, 2] sum is 6, next highest prime number is 7
7(sum of new array) minus 6(sum of input array) is 1, so add 1 to the input array.

DS:
Input: Array
OutPUt: INteger

Algorithm:
-Initialize an input_sum variable to the sum of the input array.
-Initialize a prime number variable to input_sum and increment it by 1 until it is a prime number.
-Subtract the input sum from the prime number and return the result.
=end

def prime?(num)
  (2...num).each do |n|
    return false if num % n == 0
  end
end

def minimum_number(array)
input_sum = array.sum
input_sum += 1 until prime?(input_sum)
input_sum - array.sum
end

# p minimum_number([2, 12, 8, 4, 6])
#==========================================================================================
=begin
Requirements:
-Re-order the characters of a string. so that they are concatenated into a new string in "case-insensitivitely-alphabetical-order-of-appearance" order.
-Whitespace and puncuation shall be removed.
-The input is restircted to contain no numerals and only words containign english alphabet letters.

Examples:
alphabetized("The Holy Bible")

=end

def alphabetized(string)
  new = []
  sorted = string.chars.sort_by { |char| char.downcase }
  sorted.each do |char|
    new << char if ('a'..'z').include?(char.downcase)
  end
  new.join
end

# p alphabetized("The Holy Bible")
#=================================================================
=begin
Requirements:
-Create a digital root function.
-A digital root is the recursive sum of all the digits in a number.
-Given n, take the sum of the edigits of n.
-If that value has more than one digit, continue reducing in this way until a single digit number isp roduced.
-This is only applicable to the natural numbers.

Examples:
digital_root(16)
1 + 6 = 7
digital_root(942)
9 + 4 + 2 = 15
1 + 5 = 6
digital_root(132189)
1+3+2+1+8+9 = 24
2 + 4 = 6

DS:
Input: Integer
Intermediate: Array
Output Single digit Integer

Algorithm:
-Initialize a digits variable to an array of digits of the input integer.
-Find the sum of the digits.
-Repeat until the sum is a 1 digit number, return it.
=end

def digital_root(number)
  sum > 9 ? digital_root(number.digits.sum) : number
end

# p digital_root(953)

#================================================================
=begin
Requirements:
-Implement a function which subtracts one list from another and returns the result.
-It should remove all values from list a which are present in list b, keeping their order.

Examples:
array_diff([1,2], [1]) == [2]

DS:
Input: TWo arrays
Output Array

Algorithm:
-Iterate through the characters of the second array argument.
-On each iteration:
-If the first array argument includes the current character:
-Delete it.
-Return the first array argument.
=end

# def array_diff(arr1, arr2)
#   arr2.each { |char| arr1.delete(char) if arr1.include?(char) }
#   arr1
# end

#===============================================================
=begin
Requirements:
-Uppercase letters stand for mothers.
-Lowercase letters stand for their children
-String contains only letters.
-Uppercase letters are unique.
-Place all people in alphabet order where mothers are followed by their children.

Examples:
find_children("aAbaBb") == "AaaBbb"
sorted in alphabetic order with uppercase letters coming first.

DS:
Input: String
Output: String

Algorithm:
-Intiialize a new string vairbale to an empty string.
-Iterate through a range of A to Z.
-On each iteration:
-Find the count of the current alphabet letter in the input string.
-Add the current letter to the new string multiplied by the count.
-Repeat for lowercase letter.
-Return the new string.
=end

def find_children(dancing_brigade)
  ('A'..'Z').each_with_object('') do |letter, new_string|
    new_string << letter * dancing_brigade.count(letter)
    new_string << letter.downcase * dancing_brigade.count(letter.downcase)
  end
end

p find_children("abBA")
#=========================================================
=begin
Requirements:
-The input is a string of digits.
-Cut the string into chunks(a chunk is a substring of the initial string) of size z (ignore the last chunk if its size is less than sz)
-If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk, otherwise rotate it to the left by one position.
-Put together these modified chunks and return the result as a string.

-Return "" if string size is <= 0 or if string is empty.
-Return "" if string size is >= the length of string.

Examples:
revrot(""

DS:
Input: String, Integer
Output: String

Algorithm:
-Return "" if input string size is <= 0 or >= the input string size.
-Initialize a chunks variable to an empty array.
-Initialize a new_chunk variable to an empty string.


-Cube (to the third) power every digit.
-Find the sum of the digits.
-Check if the sum is divisible by 2.
-If it is, reverse the digits of the chunk. and add it to the new_chunk variable.
-  Else rotate the digits to the left (move the first number to the end) and add it ot the new_chunk variable.
-Return the new_chunk variable.
=end

def revrot(string, integer)
  return "" if integer == 0

  chunks = string.chars.each_slice(integer).to_a
  chunks.delete_if { |chunk| chunk.size != integer }

  chunks.map do |chunk|
    chunk_sum = chunk.map do |digit|
                  digit.to_i ** 3
                end.sum

    chunk_sum % 2 == 0 ? chunk.reverse : chunk.push(chunk.shift)
  end.flatten.join
end

# p revrot("66443875", 4)

#================================================================================================
=begin
Requirements:
-Given a string of words.
-For each word:
-the second and last letter is switched.
-The first letter is replaced by its character code.
-THere are no special character used, only letters and spaces.

Examples:
decipherThis('72olle 103doo 100ya')
72 = H = Holle = Hello
103 = G = Gdoo = Good
100 = D = Dya  = Day

DS:
Input: String
Intermediate: Array
Output: String

Algorithm:
# -Initialize a numbers variable to an array of 0-9.
# -Split the input string into an array of words.
# -Iterate over the array of words. On each iteration:
# -  Iterate over the characters of the current word. On each iteration:
# -    Initialize a nums variable to an empty string.
# -    Initialize a alpha variable to an empty string.
# -    Initialize a clean_word variable to an empty array.
# -      If the current character is included in the numbers variable, add it to the nums variable.
# -      Else add it to the alpha variable.
# -      Decipher the nums variable integer to its alphabetic equivalent and add it to the clean_word variable.
# -      Add the alpha variable to the clean_word variable.
# -      Swap the second and last characters of the clean_word variable and join it back into string. Return it.
=end

def decipher_this(string)
  string.split.map do |word|
    nums = ''
    letters = ''
    new_word = ''

    word.chars.each do |char|
      ('a'..'z').include?(char.downcase) ? letters << char : nums << char
    end

    new_word << nums.to_i.chr + letters
    new_word[1], new_word[-1] = new_word[-1], new_word[1] if new_word.size > 2
    new_word
  end.join(' ')
end

# p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka")
#=========================================================================================
=begin
Requirements:
-Complete the method that takes a hash and find the nexus: the user whose rank is the closest is equal to this honor.
-Return the rank of this user.
-The key is the rank, the value is the honor.
-If nobody has an exact rank/honor match, return the rank of the user who comes closest. If there are several users who come closest, return the one with the lowest rank(value).
-The hash will not necessarily contain consecutive rank numbers, return the best match from the ranks provided.

Examples:
         rank    honor
users = {  1  =>  93,
          10  =>  55,
          15  =>  30,
          20  =>  19,
          23  =>  11,
          30  =>   2 }

DS:
INput: Hash
Intermediate: Array?
Output: Integer

Algorithm:
-Sort the key value pairs by the difference between the key and value.
-Return the key of the pair with the smallest difference.
=end

def nexus(hash)
  hash.sort_by { |key, value| (key - value).abs }[0][0]
end

# users = {  1  =>  93,
#           10  =>  55,
#           15  =>  30,
#           20  =>  19,
#           23  =>  11,
#           30  =>   2 }

# p nexus(users)

#===============================================================
=begin
Requirements:
-Write a function that takes numbers num1 and num2.
-Return 1 if there is a straight triple of a number at any place in num1, and also a straight double of the same number in num2.
-If not return 0

Examples:
triple_double(451999277, 41177722899) == 1
3 straight 9's in num1, 2 straight 9's in num2

DS:
Input: Two integers
Intermediate: Array
Output: Integer

Algorithm:
-Iterate through the digits of the first integer argument.
-On each iteration, check if num1 includes the current digit * 3 and num2 includes the current digit * 2.
-Return 1 if it does
-Else return 0.
=end

def triple_double(num1, num2)
  num1 = num1.to_s
  num2 = num2.to_s

  num1.chars.each do |num|
    return 1 if num1.include?(num * 3) && num2.include?(num * 2)
  end

  0
end
=begin
Requirements:
-Given two arrays of strings, a1 and a2.
-Return a sorted array r in lexicographical? order of the strings of a1 which are substrings of strings of a2.

DS:
Input: 2 arrays
Intermediate: Array
Output: Array

Algorithm:
-Initialize a in_array variable to an empty array.
-Iterate through the strings of the second array argument. On each iteration:
-  Iterate through the strings of the first array argumenet. On eaach iteration:
-    Check if the current string in the first array is included in the current string of the second array.
-      If it is, add it to the in_array variable.
-Sort the in_array variable and return it.
=end

def in_array(arr1, arr2)
in_array = []
  arr2.each do |arr2_word|
    arr1.each do |arr1_word|
      in_array << arr1_word if arr2_word.include?(arr1_word)
    end
  end
in_array.uniq.sort
end

def in_array(arr1, arr2)
  arr1.select do |arr1_word|
    arr2.any? do |arr2_word|
      arr2_word.include?(arr1_word)
    end
  end.sort
end

# a1 = ["arp", "live", "strong"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# p in_array(a1, a2)
#===========================================================================================
=begin
Requirements:
-Write a method that takes an array of consecutive increasing letters as input and returns the missing letter in the array.
-You will always get a valid array. It will alwaysb ebe xactly one letter missing.
-The length of the array will always be at least 2.
-The array will always contain letters in only one case.

Examples:
['a','b','c','d','f'] -> missing 'e'

DS:
Input: Array
Intermediate:
Output: String

Algorithm:
-Initialize an alphabet variable to a hash of alphabet a-z as keys and 1-26 as values.
-Iterate over the input array and its indices.
-
=end
def find_missing_letter(array)
  array.map!(&:ord)
  array.each_with_index do |num, index|
    diff = array[index+1] - num
    return (num + 1).chr if diff > 1
  end

end
# p find_missing_letter(['a','b','c','d','f'])
#+==========================================================================
=begin
Requirements:
-Given an array which wil lhave a length of at least 3) containing integers.
-The array is either entirely comprised of odd iintegers or entirely comprised of even integers except fo ra single integer.
-Write a method that takes the array as an argument and returns this outlier.

DS:
Input: Array
Output: Integer

Algorithm:
-Determine if the input array is comprised of even or odd numbers.
-Iterate through the array and return the first "outlier".
=end

def find_outlier(integers)
  odd_even = 'even'
  odd_even = 'odd' if integers.count(&:even?) < integers.count(&:odd?)


  integers.each do |num|
    if odd_even == 'even'
      return num if num.odd?
    elsif odd_even == 'odd'
      return num if num.even?
    end
  end
end

# p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36])
#=====================================================================================
=begin
Requirements:
-Given a string containing different words separated by spaces.
-More than one word? reverse each word and combine first with second, third with fourth and so on.
-If the number of words is odd, last one stays alone but has to be reversed too.
-Start it again until theres only one word without spaces.
-Return the result.

Examples:
"abc def" -> "cbafed"
"abc def ghi 123" ->
=end

=begin
Requirements:
-Given two integers. n and K
-Remove k digits from n and return the lowest number possible, without changing the order of the digits in in.
-Return the result as a string.

Example:
solve(123056, 4) - 4 digits need to be removed

DS:
Input: 2 integers
Output: String

Algorithm:
-Initialize a digits variable to an array of digits of the first integer argument.
-Find the difference between the size of the digits array and the second integer argrument.
-Find all digit combinations of that size and return the lowest value combination.
=end

def solve(number, k)
  digits = number.digits.reverse
  to_delete = digits.max(4)
end

p solve(123056, 4)
p solve(1284569,4)
=begin
Requirements:
-Given two arrays of strings, a1 and a2.
-Return a sorted array r in lexicographical? order of the strings of a1 which are substrings of strings of a2.

DS:
Input: 2 arrays
Intermediate: Array
Output: Array

Algorithm:
-Initialize a in_array variable to an empty array.
-Iterate through the strings of the second array argument. On each iteration:
-  Iterate through the strings of the first array argumenet. On eaach iteration:
-    Check if the current string in the first array is included in the current string of the second array.
-      If it is, add it to the in_array variable.
-Sort the in_array variable and return it.
=end

def in_array(arr1, arr2)
in_array = []
  arr2.each do |arr2_word|
    arr1.each do |arr1_word|
      in_array << arr1_word if arr2_word.include?(arr1_word)
    end
  end
in_array.uniq.sort
end

def in_array(arr1, arr2)
  arr1.select do |arr1_word|
    arr2.any? do |arr2_word|
      arr2_word.include?(arr1_word)
    end
  end.sort
end

# a1 = ["arp", "live", "strong"]
# a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# p in_array(a1, a2)
#===========================================================================================
=begin
Requirements:
-Write a method that takes an array of consecutive increasing letters as input and returns the missing letter in the array.
-You will always get a valid array. It will alwaysb ebe xactly one letter missing.
-The length of the array will always be at least 2.
-The array will always contain letters in only one case.

Examples:
['a','b','c','d','f'] -> missing 'e'

DS:
Input: Array
Intermediate:
Output: String

Algorithm:
-Initialize an alphabet variable to a hash of alphabet a-z as keys and 1-26 as values.
-Iterate over the input array and its indices.
-
=end
def find_missing_letter(array)
  array.map!(&:ord)
  array.each_with_index do |num, index|
    diff = array[index+1] - num
    return (num + 1).chr if diff > 1
  end

# end
# p find_missing_letter(['a','b','c','d','f'])
#+==========================================================================
=begin
Requirements:
-Given an array which wil lhave a length of at least 3) containing integers.
-The array is either entirely comprised of odd iintegers or entirely comprised of even integers except fo ra single integer.
-Write a method that takes the array as an argument and returns this outlier.

DS:
Input: Array
Output: Integer

Algorithm:
-Determine if the input array is comprised of even or odd numbers.
-Iterate through the array and return the first "outlier".
=end

def find_outlier(integers)
  odd_even = 'even'
  odd_even = 'odd' if integers.count(&:even?) < integers.count(&:odd?)


  integers.each do |num|
    if odd_even == 'even'
      return num if num.odd?
    elsif odd_even == 'odd'
      return num if num.even?
    end
  end
end

# p find_outlier([2, 4, 0, 100, 4, 11, 2602, 36])
#=====================================================================================
=begin
Examples:
p tribonacci([1, 1, 1], 10) == [1,1,1,3,5,9,17,31,57,105]
Input array starts [1,1,1], the sum of the last 3 numbers is added to the new array until its size is equal to the integer argument.

DS:
Input: Array, Integer
Intermediate:
Output: Array

Algorithm:
-If the integer argument is 3 or less, return that many elements from the input array.
-Append the sum of the last 3 digits of the input array onto the input array until the size of the array is equal to the integer argument.
-Return the array.
=end

def tribonacci(array, size)
  return array.slice(0, size) if size <= 3

  array << array.last(3).sum
  return array if array.size == size

  tribonacci(array, size)
end

# p tribonacci([3, 2, 1], 10)
# p tribonacci([1, 1, 1], 10)
# p tribonacci([300,200,100],0)

#=================================================
=begin
Requirements:
-Return true or false depending on whether the given numbe ri sa narcissistic number.
-A narcissitic number is a positive number which is the sum of its own digits, each raised to the power of the number of digits.

Examples:
p narcissistic?(153)
3 digits
each digit to the power of the number of digits 1^3 5^3 3^3
1 + 125 + 27 = 153

DS:
Input: Integer
Intermediate: Array
Output: Boolean

Algorithm:
-Split the input integer into an array of digits.
-Iterate (transform) over the digits, raising each to the power of the number of digits.
-Check if the sum of the array is equal to the input integer.
=end

def narcissistic?(number)
  digits = number.digits
  sum = digits.map { |num| num**digits.size }.sum
  sum == number
end

# p narcissistic?(115132219018763992565095597973971522401)

#=================================
def solution(string)
  string.chars.map do |char|
    char == char.upcase ? ' ' + char : char
  end.join
end

# p solution("camelCasing")

#==================================
=begin
Requirements:
-Write a function that, given a string of text, returns an array of the top 3 most occurring words.
-A word is a string of letters a to z optionally containing one or more apostrophes.
-Matches should be case insensitive, and the words in the result shoudl be lowercased.
-If a text contains fewer than three unique words, either the top 2 or top 1 words should be returned, or an empty array if a text contains no words.

Examples:
top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]
"e" appears 7 times
"ddd" appears 4 times
"aa" appears 3 times

DS:
Input: String
Intermediate: Hash
Output: Array

Algorithm:
-Initialize a word_count variable to an empty hash.
-Iniitalize an alpha variable to 'a'-'z' and apostrophe.
-Split the input string into an array of words.
-Select the words only containing characters included in the alpha variable.
-Iterate through the words variable, on each iteration:
-  set the current word as a key in the word_count variable and the count of the word in the words variable as the value.
-Return the keys of the highest 3 values.
=end

def top_3_words(string)
  alpha = ('a'..'z').to_a + ["'"]
  word_count = {}

  words = string.downcase.split.map do |word|
    word.chars.select do |char|
      alpha.include?(char)
    end.join
  end
  #words = words.delete_if { |word| word.chars.all? { |char| char == "'" } }
  words.each { |word| word_count[word] = words.count(word) if !word.empty? }
  top3values = word_count.values.max(3)
  top3values.map { |value| word_count.key(value) }
end

# # p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
p top_3_words("  //wont won't won't ")
p top_3_words("  '  ")
p top_3_words("  , e   .. ")
# # p top_3_words("In a village of La Mancha, the name of which I have no desire to call to
# # mind, there lived not long since one of those gentlemen that keep a lance
# # in the lance-rack, an old buckler, a lean hack, and a greyhound for
# # coursing. An olla of rather more beef than mutton, a salad on most
# # nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# # on Sundays, made away with three-quarters of his income.")