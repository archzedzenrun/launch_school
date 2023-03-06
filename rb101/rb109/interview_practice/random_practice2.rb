=begin
https://www.codewars.com/kata/5279f6fe5ab7f447890006a7/train/ruby
In this kata, you will write a function that returns the positions and the values of the "peaks" (or local maxima) of a numeric array.

For example, the array arr = [0, 1, 2, 5, 1, 0] has a peak at position 3 with a value of 5 (since arr[3] equals 5).

The output will be returned as an object with two properties: pos and peaks. Both of these properties should be arrays. If there is no peak in the given array, then the output should be {pos: [], peaks: []}.

Example: pickPeaks([3, 2, 3, 6, 4, 1, 2, 3, 2, 1, 2, 3]) should return {pos: [3, 7], peaks: [6, 3]} (or equivalent in other languages)

All input arrays will be valid integer arrays (although it could still be empty), so you won't need to validate the input.

The first and last elements of the array will not be considered as peaks (in the context of a mathematical function, we don't know what is after and before and therefore, we don't know if it is a peak or not).

Also, beware of plateaus !!! [1, 2, 2, 2, 1] has a peak while [1, 2, 2, 2, 3] and [1, 2, 2, 2, 2] do not. In case of a plateau-peak, please only return the position and value of the beginning of the plateau. For example: pickPeaks([1, 2, 2, 2, 1]) returns {pos: [1], peaks: [2]} (or equivalent in other languages)

Have fun!

*PROBLEM*
Input: Array of integers
Output: Hash { "pos" => [], "peaks" => [] }

Explicit Rules:
-Return index and value of "peaks"
-"Peaks" are numbers that are larger than number before and after it
-"Plateus" are consecutive same numbers that eventually lead to a smaller number
  -Only return the pos and value of where the plateu starts
-If there is no "peak" return hash with empty arrays
-Input could be empty

Implicit Rules:
-Array will contain integers only

*EXAMPLES*
p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1])

*DATA STRUCTURE*
Hash for storing positions and values
Array - iteration

*ALGORITHM*
-Create pos and peaks hash

For plateus:
-Iterate through array of numbers and indexes
  Skip first and last indexes
  -If previous index num is less than current num and next index num is equal to currnet num
    -Temp store current num and idx
  -Elseif previous index num is equal to current num and next idx num is less than current num
    -Push temp pos/value to hash

For peaks:
-Iterate through array of numbers and indexes
  -Skip first and last indexes
  -Check if previous and next index nums are less than current num
    -If they are, add current index and num to hash
  -If
=end

def pick_peaks(num_arr)
  hash = { "pos" => [], "peaks" => [] }
  temp = []
  num_arr.each_with_index do |num, idx|
    next if idx == 0 || idx == num_arr.size - 1
    if num_arr[idx-1] < num && num_arr[idx+1] == num
      temp = [idx, num]
    # elsif num_arr[idx-1] == num && num_arr[idx+1] < num
    #   hash["pos"] << temp[0]
    #   hash["peaks"] << temp[1]
    elsif num_arr[idx-1] < num && num_arr[idx+1] < num
      hash["pos"] << idx
      hash["peaks"] << num
    end

    if num_arr[idx-1] == num && num_arr[idx+1] < num && temp != []
    hash["pos"] << temp[0]
    hash["peaks"] << temp[1]
    end
    p hash
  end

  hash
end

# test cases
#  p pick_peaks([1,2,3,6,4,1,2,3,2,1]) == {"pos"=>[3,7], "peaks"=>[6,3]}
#  p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,3]) == {"pos"=>[3,7], "peaks"=>[6,3]}
#  p pick_peaks([3,2,3,6,4,1,2,3,2,1,2,2,2,1]) == {"pos"=>[3,7,10], "peaks"=>[6,3,2]}
# p pick_peaks([2,1,3,1,2,2,2,2,1]) == {"pos"=>[2,4], "peaks"=>[3,2]}
#  p pick_peaks([2,1,3,1,2,2,2,2]) == {"pos"=>[2], "peaks"=>[3]}
# ([1,2,2,2,1,5,3])

p pick_peaks([2, 1, 3, 2, 2, 2, 2, 1]) #== {"pos"=>[2], "peaks"=>[3]}

#https://www.mathsisfun.com/algebra/functions-maxima-minima.html




=begin
https://leetcode.com/problems/positions-of-large-groups/

In a string s of lowercase letters, these letters form consecutive groups of the same character.

For example, a string like s = "abbxxxxzyy" has the groups "a", "bb", "xxxx", "z", and "yy".

A group is identified by an interval [start, end], where start and end denote the start and end indices (inclusive) of the group. In the above example, "xxxx" has the interval [3,6].

A group is considered large if it has 3 or more characters.

Return the intervals of every large group sorted in increasing order by start index.

EXAMPLES:
Input: s = "abbxxxxzzy"
Output: [[3,6]]
Explanation: "xxxx" is the only large group with start index 3 and end index 6.

Input: s = "abc"
Output: []
Explanation: We have groups "a", "b", and "c", none of which are large groups.

Input: s = "abcdddeeeeaabbbcd"
Output: [[3,5],[6,9],[12,14]]
Explanation: The large groups are "ddd", "eeee", and "bbb".




Constraints:
1 <= s.length <= 1000
s contains lowercase English letters only.

*PROBLEM*
Input: String
Output: Array of nested arrays

Explicit Rules:
-Input will be lowercase
-If input is 3 or less chars, return empty array
-Return start and end indexes of large groups
-Large groups are 3 or more chars

Implicit Rules:
-Input will only contain a-z lowercase

*EXAMPLES*
p pos_large_group("abcdddeeeeaabbbcd")
large groups:
ddd idx 3..idx 5
eeee idx 6..idx 9
bbb idx 12..idx 14

*DATA STRUCTURE*
Array - iteration

*ALGORITHM*
-Init results variable to empty array
-Init group variable to empty array
-Split input str into array of chars
-Iterate through chars array and indexes
  Add current char to group array
  If current char is not equal to last char in group array
    -Add the index range of chars in group to results if group size is 3 or more
    -Set group to empty array

-Return results
=end

def pos_large_group(str)
  results = []
  group = []
  return [] if str.size < 3
  results << [0, str.size - 1] if str.chars.uniq.size == 1
  str.chars.each_with_index do |char, idx|
    if group.last != char  #char == str.chars.last
      results << [idx - group.size,idx - 1] if group.size >= 3
      group = []
    end
    group << char
    p group
  end

  results
end

p pos_large_group("babaaaabbb")
# p pos_large_group("a")
# p pos_large_group("aa")
# p pos_large_group("aaa") == [[0, 2]] # []
# p pos_large_group("abbxxxxzzy") #== [[3,6]]
#  p pos_large_group("abc") == []
#  p pos_large_group("abcdddeeeeaabbbcd") == [[3,5],[6,9],[12,14]]

# leetcode will test against
# p "abcdddeeeeaabbbcd"
# p "abc"
# p "abcdddeeeeaabbbcd"

=begin

https://edabit.com/challenge/Ru6ZL8jpYZ7kQQPvB
Given a sentence, return a list of strings which gradually reveals the next letter in every word at the same time. Use underscores to hide the remaining letters.

*problem*
Input: String
Output: Array

rules:
-

*examples*
Array will end up at size of split string (how many words)
1st iteration -> chars of words replaced with "_"
1 iteration per word

*algorithm*
-Init new_array to empty array
-Split input into array of words
  -Iterate over words array
  -TRansform chars of each word into _
  -Join words back into string and add to new_array

=end

# test cases

# def grant_the_hint(str)
#   new_array = []

#   words = str.split
#   starting_array = words.map do |word|
#                      word.chars.map do |char|
#                       "_"
#                      end.join
#                     end.join(' ')

#   # starting_array.split.each.with_index do |word, word_idx|
#   #   p words[word_idx]

#   #   end
#   (0..words.size).each do |idx|

#     words.each do |word|
#       #next if word[idx] == nil
#       #p [word[idx],starting_array.split[idx].size]
#       new_array << word[idx] + ("_" * (starting_array.split[idx].size - 1))#.size - idx )
#       #word[idx] +
#     end
#   end
#   new_array
# end


def largest_word(str)
  alphabet = [" ", "_"]
  str.split.map do |word|
    count = 0
    word.chars.each do |char|
      count += 1 if !alphabet.include?(char)
    end
    count
  end.max
end


def grant_the_hint(str)
  iterations = largest_word(str)

  new_array = []
  new_array << str

  iterations.times do
  largest_word_size = largest_word(str)

  new_word = str.split.map.with_index do |word, idx|
    word_size = largest_word(word)
    if word_size == largest_word_size
      range = [0...largest_word_size - 1]

      word[range[0]] + ("_" * (word.size - range[0].size))
    else
      word
    end
  end.join(' ')

  new_array << new_word
  str = new_word


end

  new_array.reverse
end

# this is an onomatopeia

p grant_the_hint('Mary Queen of Scots') == [
'____ _____ __ _____',
'M___ Q____ o_ S____',
'Ma__ Qu___ of Sc___',
'Mar_ Que__ of Sco__', #idx 2
'Mary Quee_ of Scot_', #idx 1 -> rev = word[0...-idx], hidden = '_' * idx -->
'Mary Queen of Scots' # first run, idx 0
]

p grant_the_hint('The Life of Pi') == [
'___ ____ __ __',
'T__ L___ o_ P_',
'Th_ Li__ of Pi',
'The Lif_ of Pi',
'The Life of Pi'
]


 p grant_the_hint('The River Nile') == [
'___ _____ ____',
'T__ R____ N___',
'Th_ Ri___ Ni__',
'The Riv__ Nil_',
'The Rive_ Nile',
'The River Nile'
]

p grant_the_hint('The Colour Purple') == [
'___ ______ ______',
'T__ C_____ P_____',
'Th_ Co____ Pu____',
'The Col___ Pur___',
'The Colo__ Purp__',
'The Colou_ Purpl_',
'The Colour Purple'
]

p grant_the_hint('The Battle of Hastings') == [
'___ ______ __ ________',
'T__ B_____ o_ H_______',
'Th_ Ba____ of Ha______',
'The Bat___ of Has_____',
'The Batt__ of Hast____',
'The Battl_ of Hasti___',
'The Battle of Hastin__',
'The Battle of Hasting_',
'The Battle of Hastings']

p grant_the_hint('Ant-Man and the Wasp') == [
'_______ ___ ___ ____',
'A______ a__ t__ W___',
'An_____ an_ th_ Wa__',
'Ant____ and the Was_',
'Ant-___ and the Wasp',
'Ant-M__ and the Wasp',
'Ant-Ma_ and the Wasp',
'Ant-Man and the Wasp'
]

p grant_the_hint('A billion seconds is almost 32 years') == [
'_ _______ _______ __ ______ __ _____',
'A b______ s______ i_ a_____ 3_ y____',
'A bi_____ se_____ is al____ 32 ye___',
'A bil____ sec____ is alm___ 32 yea__',
'A bill___ seco___ is almo__ 32 year_',
'A billi__ secon__ is almos_ 32 years',
'A billio_ second_ is almost 32 years',
'A billion seconds is almost 32 years'
]


def grant_the_hint(string)
  soln = []
  starting_str = string.chars.map{|char| char != ' ' ? '_' : char}.join
  soln << starting_str

  longest_word_sz = string.split(' ').max_by{|el| el.size}.size

  longest_word_sz.times do |num|
    #at first go around, return string with words whose chars at index 0 will reveal themselves, push to `soln`
    altered_string = string.split(' ').map do |word|
      #return word with only first certain number of letters revealed
      altered_word = ''
      word.chars.each_with_index do |char, idx|
        if idx == num
          altered_word << char
        elsif char != '_' && idx < num
          altered_word << char
        else
          altered_word << '_'
        end
      end

      altered_word
    end.join(' ')

    soln << altered_string
  end
  soln
end

=begin
https://edabit.com/challenge/3jzycf6fcgwZbvpcf

Create a function that takes in a number as a string n and returns the number without trailing and leading zeros.

Trailing Zeros are the zeros after a decimal point which don't affect the value (e.g. the last three zeros in 3.4000 and 3.04000).
Leading Zeros are the zeros before a whole number which don't affect the value (e.g. the first three zeros in 000234 and 000230).

Examples:
removeLeadingTrailing("230.000") ➞ "230"

removeLeadingTrailing("00402") ➞ "402"

removeLeadingTrailing("03.1400") ➞ "3.14"

removeLeadingTrailing("30") ➞ "30"

Notes
Return a string.
If you get a number with .0 on the end, return the integer value (e.g. return "4" rather than "4.0").
If the number is 0, 0.0, 000, 00.00, etc... return "0".

*problem*
Input: String
Output: String

Rules:
-Remove leading and trailing 0's
-Trailing 0's are 0's after decimal that dont affect value
-Leading 0's are 0's before a whole number that dont affect value
-Return 0 if all nums are 0

Implicit:
-String wont be empty
-String will only contain 0-9 .

*DS*
Array

*ALGORITHM*
-Init new str variable to empty str
-Split str into array of digits
-Iterate through digits array
  -If chars from first position to current position are all 0, skip current char
  -Add 0-9 . to new str
  -If new str includes . skip current char if all chars from current position to end are 0
-Return new str
=end

def removeLeadingTrailing(str)
  new_num = []
  str.chars.each_with_index do |num, idx|

    next if str[0..idx].chars.all? { |n| n == '0' }
    next if new_num.include?(".") && str[idx..-1].chars.all? { |n| n == '0' }
    new_num << num

  end

  new_num.pop if new_num.last == "."
  new_num.join

end

# test cases
p removeLeadingTrailing("230.000") ==  "230"

p removeLeadingTrailing("00402") == "402"

p removeLeadingTrailing("03.1400") == "3.14"

p removeLeadingTrailing("30") == "30"


=begin
https://edabit.com/challenge/sRuLYeBet7XE2wpRL

Create a function that takes two arguments: an array arr and a number num. If an element occurs in arr more than num times, remove the extra occurrence(s) and return the result.



delete_occurrences([1, 1, 1, 1], 2) ➞ [1, 1]

delete_occurrences([13, true, 13, nil], 1) ➞ [13, true, nil]

delete_occurrences([true, true, true], 3) ➞ [true, true, true]

Notes
Do not alter the order of the original array.

*PROBLEM*
Input: Array, Integer
Output: Array

Explicit Rules:
-Remove extra elements from array that occur more than integer argument
-Dont mutate original array

Implicit Rules:
-Array may contain any type of object
-Array wont be empty

*EXAMPLES*

*DATA STRUCTURE*
Arrray

*ALGOIRITHM*
-Init new_array to empty array
-Iterate through input array
  Add element to new_array unless count of current element in new_array is equal to integer
-Return new_array
=end

def delete_occurrences(arr, max)
  arr.each_with_object([]) do |element, new_arr|
    new_arr << element unless new_arr.count(element) == max
  end
end

# test cases
p delete_occurrences([1, 1, 1, 1], 2)  == [1, 1]
p delete_occurrences([13, true, 13, nil], 1)  == [13, true, nil]
p delete_occurrences([true, true, true], 3) == [true, true, true]


=begin

https://edabit.com/challenge/62BAcgsNSdwYmE9ty

Given a letter, created a function which returns the nearest vowel to the letter. If two vowels are equidistant to the given letter, return the earlier vowel.

Examples
nearestVowel("b") ➞ "a"

nearestVowel("s") ➞ "u"

nearestVowel("c") ➞ "a"

nearestVowel("i") ➞ "i"
Notes
All letters will be given in lowercase.
There will be no alphabet wrapping involved, meaning the closest vowel to "z" should return "u", not "a".

*PROBLEM*
Input: String
Output: String

Explicit Rules:
-Find the nearest vowel to the input
-If there are 2 vowels at equal distance, return the earlier vowel
-Letters will be lowercase
-No wrapping involved

Impliict Rules:
-Input wont be empty
-Input will be a-z
-vowels are aeiou

*DATA STRUCTURE*
Hash - vowels/distance to input

*ALGORITHM*
-Create a hash with a-z as keys 1-26 as values
-Init vowel_positions variable to empty hash

-Iterate through alphabet positions hash
  -If current key is a vowel
  -Find the difference between input letter position and current vowel position
    -Add vowel as key and difference as value to vowel_positions hash
-Find the smallest difference (value) in vowel_positions
-Return the key of smallest diff

=end

def nearest_vowel(letter)
  alpha_pos = ('a'..'z').zip(1..26).to_h
  vowel_pos = {}

  alpha_pos.each do |char, position|
    if 'aeiou'.include?(char)
      vowel_pos[char] = (position - alpha_pos[letter]).abs
    end
  end
  p vowel_pos
  vowel_pos.min_by { |_, pos| pos }[0]

end

# test cases

p nearest_vowel("s") #== "u"
 p nearest_vowel("c") #== "a"
 p nearest_vowel("i") #== "i"
 p nearest_vowel("z") #== "u"


=begin


https://fine-ocean-68c.notion.site/Problem-List-d3736bd5cd5b4be797720aa42803c2e5#fc44c9d532dd4bb082be077ce15c6ea9

Create a function that returns an array that expands by 1 from 1 to the value of the input, and then reduces back to 1. Items in the lists will be the same as the length of the lists.

Examples:
diamond_arrays(1) ➞ [[1]]

diamond_arrays(2) ➞ [[1], [2, 2], [1]]

diamond_arrays(5) ➞ [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4], [5, 5, 5, 5, 5], [4, 4, 4, 4], [3, 3, 3], [2, 2], [1]]

*PROBLEM*
Input: Integer
Output: Array with nested arrays

Rules:
-Subarrays go from 1 up to the input num and back to 1
-Each subarray contains integers that are equal to the size of the array

Implicit:
-Input will be positive integer
-Input wont be empty

*EXAMPLES*
p diamond_arrays(2) #== [[1], [2, 2], [1]]

*DS*
Array

*ALGORITHM*
-Init results variable to empty array
-Iterate from 1 up to the input
  -Init temp variable to empty array
  -Add current num to temp until temp size is equal to current num
  -Add temp to results
=end
def sub_array_builder(n1, n2)
  result = []
  range = (n1..n2)
  range = (n1.downto(n2)) if n1 > n2

  range.each do |num|
    temp = []
    temp << num until temp.size == num
    result << temp
  end
  result
end

def diamond_arrays(input_num)
  results = []
  return [[1]] if input_num == 1
  up = sub_array_builder(1, input_num)
  down = sub_array_builder(input_num - 1, 1)
  # (1..input_num).each do |num|
  #   temp = []
  #   temp << num until temp.size == num
  #   results << temp
  # end

  # (input_num - 1).downto(1).each do |num|
  #   temp = []
  #   temp << num until temp.size == num
  #   results << temp
  # end

  up + down
end

# test cases
p diamond_arrays(1) #== #[[1]]
p diamond_arrays(2) == [[1], [2, 2], [1]]
p diamond_arrays(5) == [[1], [2, 2], [3, 3, 3], [4, 4, 4, 4], [5, 5, 5, 5, 5], [4, 4, 4, 4], [3, 3, 3], [2, 2], [1]]


=begin
Return an Array of Subarrays

Write a function that takes three arguments (x, y, z) and returns an array containing x subarrays (e.g. [[], [], []]), each containing y number of item z.

    x Number of subarrays contained within the main array.
    y Number of items contained within each subarray.
    z Item contained within each subarray.

Examples

matrix(3, 2, 3) ➞ [[3, 3], [3, 3], [3, 3]]

matrix(2, 1, "edabit") ➞ [["edabit"], ["edabit"]]

matrix(3, 2, 0) ➞ [[0, 0], [0, 0], [0, 0]]

Notes

    The first two arguments will always be integers.
    The third argument is either a string or an integer.



*problem*
Input: 2 Integers, 3rd argument string or integer (x, y, z)
Output: Array of nested arrays

Rules:
-Return an array containing x subarrays
-Each subarray contains y number of z objects

Implicit:
-Integers will be positive

*DATA STRUCTURE*
Array

*ALGORITHM*
-Init results variable to empty array
-Iterate from 1 up to first argument
  -Create temp variable to empty array
  -Add third argument to temp as many times indicated by second argument
  -Add temp to results
-Return results

=end

def matrix(x, y, z)
  (1..x).each_with_object([]) do |iteration, new_arr|
    temp = []
    y.times do |time|
      p time
      temp << z
    end
    new_arr << temp
  end
end

# test cases
p matrix(3, 2, 3) #== [[3, 3], [3, 3], [3, 3]]
p matrix(2, 1, "edabit") == [["edabit"], ["edabit"]]
p matrix(3, 2, 0) == [[0, 0], [0, 0], [0, 0]]


=begin
https://edabit.com/challenge/NSFyCjWkpBgQSNa4d
Create a function which replaces all the x's in the string in the following ways:

Replace all x's with "cks" UNLESS:

    The word begins with "x", therefore replace it with "z".
    The word is just the letter "x", therefore replace it with "ecks".

Examples

x_pronounce("Inside the box was a xylophone") ➞ "Inside the bocks was a zylophone"

x_pronounce("The x ray is excellent") ➞ "The ecks ray is eckscellent"

x_pronounce("OMG x box unboxing video x D") ➞ "OMG ecks bocks unbocksing video ecks D"

Notes

    All x's are lowercase.
    I know that not all words with x's follow this rule, but there are too many edge cases to count!

*PROBLEM*
Input: String
Output: Streing

Explicit Rules:
-Replace x's with "cks"
-If a word starts with x replace it with z
-If a word is just x replace it with "ecks"
-All x's will be lowrcase

Implicit Rules:
-String wont be emtpy
-Words are separated by spaces

*DATA STRUCTURE*
Array

*ALGORITHM*
-Split input string into array of words
-Iterate over words array
  -Iterate through chars of word
    -If only char in the word is x, replace with "ecks"
    -If first char is x, replace with z
    -If char is x, replace with "cks"
-Join array back into string and return it
=end

def x_pronounce(str)
  str.split.map do |word|
    word = 'ecks' if word == "x"
    word[0] = 'z' if word[0] == 'x'
    word.chars.map do |char|
      char == "x" ? "cks" : char
    end.join
  end.join(' ')
end

p x_pronounce("Inside the box was a xylophone") == "Inside the bocks was a zylophone"
 p x_pronounce("The x ray is excellent") == "The ecks ray is eckscellent"
 p x_pronounce("OMG x box unboxing video x D") == "OMG ecks bocks unbocksing video ecks D"



=begin
A Keyword Cipher is a monoalphabetic cipher which uses a keyword to provide encryption on given string of message.

Create a function that takes two arguments: a string message and a string key, and returns an encoded message.

For the encryption key, the keyword is placed at the beginning, followed by the rest of the characters in the alphabet in order (in other words, with the keyword characters removed):

A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z
K|E|Y|W|O|R|D|A|B|C|F|G|H|I|J|L|M|N|P|Q|S|T|U|V|X|Z

The encrypted message substitutes each plaintext character with the encryption key character in the corresponding position.

Return the given message encrypted against the key:

eMessage = "KEYABC"
# A = K, B = E, C = Y, H = A, I = B, J = C

Examples

keyword_cipher("keyword", "abchij") ➞ "keyabc"

keyword_cipher("purplepineapple", "abc") ➞ "pur"

keywordCipher("mubashir", "edabit") ➞ "samucq"

Notes

    Don't forget to remove duplicates after concatenating string with keyword.
    Non-alphabetic characters must be left as they are.


*PROBLEM*
Input: 2 Strings (message, key)
Output: String

Explicit Rules:
-

Implicit Rules:
-First string will be 26 chars or less
-String chars will be lowercase a-z
-String key may contain other chars  - stay the same

*EXAMPLES*
A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z
P|U|R|L|E|I|N|A|B C D F G H J K M O Q S T V W X Y Z
p u r l e p i n e a p p l e
A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z
M U B A S H I R
         https://edabit.com/challenge/xMjdD266Pm2G6Sfd7

*DS*
Hash

*ALGORITHM*
-Init alpha_pos to an array of a-z
-Subtract the unique letters of first string from an array of alpha letters
-The remaining letters are sorted alphabetically and added after the first string
-Combine alpha_pos and concatenated string to a hash with a-z as keys, string chars as values

-Iterate through chars of second string argument
  -If char is included in hash keys, replace char with hash value
  -Else leave char as is
-Return new string
=end

def keyword_cipher(word, key)
  word = word.chars.uniq
  encrypted_message = word + (('a'..'z').to_a - word).sort

  alphabet = ('a'..'z').zip(encrypted_message).to_h

  key.chars.map do |char|
    alphabet.keys.include?(char) ? alphabet[char] : char
  end.join
end

p keyword_cipher("keyword","abc") == "key"
p keyword_cipher("keyword","xyz") == "vxz"
p keyword_cipher("keyword","aeiou") == "kobjs"
p keyword_cipher("purplepineapple","abc") == "pur"
p keyword_cipher("purplepineapple","xyz") == "xyz"
p keyword_cipher("purplepineapple","aeiou") == "pebjt"
p keyword_cipher("etaoinshrdlucmfwypvbgkjqxz","abc") == "eta"
p keyword_cipher("etaoinshrdlucmfwypvbgkjqxz","xyz") == "qxz"
p keyword_cipher("etaoinshrdlucmfwypvbgkjqxz","aeiou") == "eirfg"
p keyword_cipher("tfozcivbsjhengarudlkpwqxmy","abc") == "tfo"
p keyword_cipher("tfozcivbsjhengarudlkpwqxmy","tjuukf")== "kjpphi"
p keyword_cipher("tfozcivbsjhengarudlkpwqxmy","ajqqtb") =="tjuukf"
p keyword_cipher("tfozcivbsjhengarudlkpwqxmy","a_bc&*83") == "t_fo&*83"
p keyword_cipher("mubashir","pakistan") == "lmecpqmj"
p keyword_cipher("mubashir","edabit")== "samucq"


=begin
Write a function that returns true if a given name can generate an array of words.

Each letter in the name may only be used once.
All letters in the name must be used.

*PROBLEM*
Input: String, Array
Output: Boolean

Explicit:
-Return true/false if a given name can create a array of words
-Each letter in name can only be used once
-All letters must be used

Implicit:
-Uppercase and lowercase are treated the same

*Examples*
"Justin Bieber", ["injures", "ebb", "it"])
 "Matt Damon", ["madman"]) == false

 *DS*
 Array

 *ALGORITHM*
 -Join name into a string without spaces
 -Join words into a string
 -Compare the difference
 -If the difference is empty return true
 -Else return false
=end

def anagram(name, words)
  name = name.split(' ').join.downcase.chars
  words = words.join.chars
  name.sort == words.sort
end

p anagram("Jeff Goldblum", ["jog", "meld", "bluffs"]) == false
p anagram("Justin Bieber", ["injures", "ebb", "it"]) #== true
 p anagram("Natalie Portman", ["ornamental", "pita"]) == true
p anagram("Emma Watson", ["mows", "meant", "a"]) == true
 p anagram("Daniel Radcliffe", ["clarified", "elf", "and"]) == true
 p anagram("Tom Hiddleston", ["tenths", "mood", "lid"]) == true
p anagram("Blake Lively", ["key", "veal", "bill"]) == true
p anagram("Ryan Reynolds", ["yonder", "sly", "ran"]) == true
p anagram("Kristen Stewart", ["trinkets", "war", "set"]) == true
p anagram("Chris Pratt", ["chirps", "rat"]) == false

p anagram("Taylor Swift", ["stratify", "ow"]) == false
p anagram("Adam Levine", ["medieval", "man"]) == false
p anagram("Blake Shelton", ["betoken", "all", "she"]) == false
p anagram("Miley Cyrus", ["lyric", "my", "suer"]) == false
p anagram("Matt Damon", ["madman"]) == false
p anagram("Graham Norton", ["graham", "not", "or"])== false


=begin
Someone has attempted to censor my strings by replacing every vowel with a *, l*k* th*s. Luckily, I've been able to find the vowels that were removed.

Given a censored string and a string of the censored vowels, return the original uncensored string.

Example
uncensor("Wh*r* d*d my v*w*ls g*?", "eeioeo") ➞ "Where did my vowels go?"
uncensor("abcd", "") ➞ "abcd"
uncensor("*PP*RC*S*", "UEAE") ➞ "UPPERCASE"

Notes
    The vowels are given in the correct order.
    The number of vowels will match the number of * characters in the censored string.

I: two string object, first is the message and second is the vowels that have been censored
O: string

Rules:
- vowels in the message were replaced by asterisk (*)
- censored vowels have been given in order.
  - ex) the first vowel in the vowels_str replaces the first asterisk, the second one replaces the second, etc
- uppercase and lowercasr strings in both input objects

Examples:
inputs: uncensor("Wh*r* d*d my v*w*ls g*?", "eeioeo")
indexes:                                     012345
                  Wh0r1 d2d my v3w4ls g5?
                  Where did my vowels go?

inputs: uncensor("abcd", "")
                        no vowels were removed, so return original message


inputs:  uncensor("*PP*RC*S*", "UEAE")
indexes:                        0123
                  0PP1RC2S3
                  UPPERCASE

inputs: uncensor('Ch**s*, Gr*mm*t -- ch**s*', 'eeeoieee')
indexes:                                       01234567
                  Ch01s2, Gr3mm4t -- ch56s7
                  Cheese, Grommit -- cheese


inputs: ('*l*ph*nt', 'Eea')
                      012
          Elephant

Data Structures:
I: stirng
Interim: arrays --> I want the index
O: string

Algorithm:
- generate a vowels_hash to hold position as key and vowel as value # {'0' => "e", '1'=>"e",'2'=>"i",'3'=> "o"....}

- tag message with ascending values to asterisk from 0 to last index of second argument  # 'Wh0r1 d2d my v3w4ls g5?'
- initialize an `indexed_str`
  - iterate over the message string
    - when I find an astesrisk
      - IF indexed_str does NOT contain asterisk yet
        - `counter_up` that starts at 0
        - push counter_up into indexed_str # still at zero
      - if its not the first one,
        - push counter_up.succ
    - otherwise
    ## result expected: # 'Wh0r1 d2d my v3w4ls g5?'

- iterate over indexed_str
  - if current character is found in the vowels_hash, then replace it in this string


=end

# def gen_hash(str)
#   new_hash = {}
#   str.chars.each_with_index do |ch, idx|
#     new_hash[idx.to_s] = ch
#   end
#   new_hash
# end


# def uncensor(message, vowels)
#   vowels_hash = gen_hash(vowels)

#   indexed_str = ''

#   counter_up = '0'

#   message.chars.each do |ch|
#     if ch == '*'
#       if !indexed_str.chars.include?('0') # if it's the first *
#         # counter_up
#         indexed_str << counter_up
#       elsif indexed_str.chars.include?('0') # not the first *
#         counter_up = counter_up.succ
#         indexed_str << counter_up
#       end
#     else # just letters
#       indexed_str << ch
#     end
#   end

#   results = ''

#   indexed_str.chars.each do |ch|
#     if vowels_hash.keys.include?(ch)
#       results << vowels_hash[ch]
#     else
#       results << ch
#     end
#   end
#   results
# end

# def uncensor(str, vowels)
#   soln = []
#   index = 0
#   str.chars.each_with_index do |char, idx|
#     if char == '*'
#       soln << vowels[index]
#       index += 1
#     else
#       soln << char
#     end
#   end

#   soln.join
# end

def uncensor(str, vowels)
  vowels = vowels.chars
  str.chars.map { |char| char == "*" ? vowels.shift : char }.join
end

p uncensor('Wh*r* d*d my v*w*ls g*?', 'eeioeo') == 'Where did my vowels go?'
p uncensor('abcd', '') == 'abcd'
p uncensor('*PP*RC*S*', 'UEAE') == 'UPPERCASE'
p uncensor('Ch**s*, Gr*mm*t -- ch**s*', 'eeeoieee') == 'Cheese, Grommit -- cheese'
p uncensor('*l*ph*nt', 'Eea') == 'Elephant'


def doubleSwap(str, ch1, ch2)
  new_str = ''
  str.chars.map do |char|
    if char == ch1
      ch2
    elsif char == ch2
      ch1
    else
      char
    end
  end.join

end

def doubleSwap(str, ch1, ch2)
  str.chars.map do |char|
    char = ch2 if char == ch1
    char = ch1 if char == ch2
    char
  end
end

p doubleSwap("aabbccc", "a", "b") #== "bbaaccc"
p doubleSwap("random w#rds writt&n h&r&", "#", "&") == "random w&rds writt#n h#r#"
p doubleSwap("128 895 556 788 999", "8", "9") == "129 985 556 799 888"
p doubleSwap("mamma mia", "m", "a") == "amaam aim"
p doubleSwap("**##**", "*", "#") == "##**##"
p doubleSwap("123456789", "4", "5") == "123546789"
p doubleSwap("445566&&", "4", "&") == "&&556644"
p doubleSwap("!?@,.", ",", ".")== "!?@.,"
p doubleSwap("Q_Q T_T =.= >.<", "Q", "T") == "T_T Q_Q =.= >.<"
p doubleSwap("(Q_Q) (T_T) (=.=) (>.<)", ")", "(" )== ")Q_Q( )T_T( )=.=( )>.<("
p doubleSwap("<>", ">", "<") == "><"
p doubleSwap("001101", "1", "0") == "110010"
p doubleSwap("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~", "a", "b") == "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`bacdefghijklmnopqrstuvwxyz{|}~"


=begin
https://www.codewars.com/kata/523d2e964680d1f749000135


Create a function, that accepts an arbitrary number of arrays and returns a single array generated by alternately appending elements from the passed in arguments. If one of them is shorter than the others, the result should be padded with nils.

Examples:

interleave([1, 2, 3], ["c", "d", "e"]) == [1, "c", 2, "d", 3, "e"]
interleave([1, 2, 3], [4, 5]) == [1, 4, 2, 5, 3, nil]
interleave([1, 2, 3], [4, 5, 6], [7, 8, 9]) == [1, 4, 7, 2, 5, 8, 3, 6, 9]
interleave([]) == []

*PROBLEM*
Input: Varying number of arrays
Output: Array

Rules:
-Create an array with alternating elements from each input array
-If one array is shorter, add nils until the arrays are equal size

Implicit:
-Arrays may contain integers or strings
-Input may be empty, return emtpy array

*DATA STRUCTURE*
Array

*ALGORITHM*
-Init results variable to empty array
-Init a counter variable to 0 - will be incremented to the size of the largest input array - 1
-Until counter is equal to size of the largest input array - 1
-Iterate through nested arrays
  -Add the element from current subarray at counter index to results
  -Increment counter by 1
Return results array

=end

def interleave(*arr)
  largest_arr_size = arr.map(&:size).max
  results = []
  counter = 0

  until counter == largest_arr_size
    arr.each do |subarr|
      results << subarr[counter]
    end
    counter += 1
  end

  results
end

# test cases
p interleave([1, 2, 3], ["c", "d", "e"]) == [1, "c", 2, "d", 3, "e"]
p interleave([1, 2, 3], [4, 5]) == [1, 4, 2, 5, 3, nil]
p interleave([1, 2, 3], [4, 5, 6], [7, 8, 9]) == [1, 4, 7, 2, 5, 8, 3, 6, 9]
p interleave([]) == []

=begin
https://www.codewars.com/kata/5340298112fa30e786000688


The objective is to return all pairs of integers from a given array of integers that have a difference of 2.

The result array should be sorted in ascending order of values.

Assume there are no duplicate integers in the array. The order of the integers in the input array should not matter.


[1, 2, 3, 4]  should return [[1, 3], [2, 4]]

[4, 1, 2, 3]  should also return [[1, 3], [2, 4]]

[1, 23, 3, 4, 7] should return [[1, 3]]

[4, 3, 1, 5, 6] should return [[1, 3], [3, 5], [4, 6]]

*Problem*
Input: Array
Output: Array

Rules:
-Return pairs of numbers that hav a difference of 2

Implicit:
-Empty input returns empty array
-Return empty array if there are no pairs

*DS*
Array

*ALGORITHM*
-Init results variable to empty array
-Iterate through input array with index
  -Iterate through an index range of current index to last index
    -Find difference between outer num and current num
    -If its 2, add outer num and current num in an array to results
-Return results
=end

def twos_difference(arr)
  results = []

  arr.each_with_index do |num1, num1_idx|
    arr[num1_idx + 1..-1].each do |num2|
      difference = (num1 - num2).abs
      if difference == 2
        results << [num1, num2].sort
      end
    end
  end

  results.sort
end



# test cases
# p twos_difference([1, 2, 3, 4]) #== [[1, 3], [2, 4]]
# p twos_difference([1, 3, 4, 6]) == [[1, 3], [4, 6]]
p twos_difference([0, 3, 1, 4]) == [[1, 3]]
p twos_difference([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p twos_difference([6, 3, 4, 1, 5]) == [[1, 3], [3, 5], [4, 6]]
p twos_difference([3, 1, 6, 4]) == [[1, 3], [4, 6]]
# p twos_difference([1, 3, 5, 6, 8, 10, 15, 32, 12, 14, 56]) == [[1, 3], [3, 5], [6, 8], [8, 10], [10, 12], [12, 14]]
# p twos_difference([1, 4, 7, 10]) == []
# p twos_difference([]) == []



=begin
Given an n x n array, return the array elements arranged from outermost elements to the middle element, traveling clockwise.

array = [[1,2,3],
         [4,5,6],
         [7,8,9]]
snail(array) #=> [1,2,3,6,9,8,7,4,5]

For better understanding, please follow the numbers of the next array consecutively:

array = [[1,2,3],
         [8,9,4],
         [7,6,5]]
snail(array) #=> [1,2,3,4,5,6,7,8,9]

This image will illustrate things more clearly:

NOTE: The idea is not sort the elements from the lowest value to the highest; the idea is to traverse the 2-d array in a clockwise snailshell pattern.

NOTE 2: The 0x0 (empty matrix) is represented as en empty array inside an array [[]].

*problem*
Input: Arrays
Output: Array

Explicit Rules:
-Emtpy inputs returns [[]]
-Traverse 2-d array in clockwise pattern

Implicit Rules:
-# of input arrays may vary
-all arrays will be the saem size as each other

*examples*



[18, 31, 36, 35, 26, 9],





[19, 32, 33, 34, 25, 8],
[18, 31, 36, 35, 26, 9],
[17, 30, 29, 28, 27, 10],


1 2 3 4 5 6

array size - 1 = 5 (index)
all numbers at index 5 from every other arr

7 8 9 10 11



*DS*
Array to hold results

*ALGORITHM*



         [ ,  , 36,  ,  ,  ],



=end

def snail(*arrays)
  results = []
  arrays = arrays[0]

  until arrays.empty?
    max_size_idx = arrays[0].size - 1

    results << arrays.first
    arrays.shift
    break if arrays.empty?

    arrays.each { |arr| results << arr.pop }
    break if arrays.empty?

    results << arrays.last.reverse

    arrays.pop
    break if arrays.empty?

    arrays.reverse.each { |arr| results << arr.shift }

    break if arrays.empty?
    max_size_idx = arrays[0].size - 1
  end

  results.flatten
end

# test case

 p snail( [[1,2,3],[4,5,6],[7,8,9]]) == [1, 2, 3, 6, 9, 8, 7, 4, 5]
 p snail([[1,2,3],[8,9,4],[7,6,5]]) == [1,2,3,4,5,6,7,8,9]

p snail([1]) == [1]
 p snail([[]]) == []
p snail([[1, 2, 3, 4, 5, 6],
         [20, 21, 22, 23, 24, 7],
         [19, 32, 33, 34, 25, 8],
         [18, 31, 36, 35, 26, 9],
         [17, 30, 29, 28, 27, 10],
         [16, 15, 14, 13, 12, 11]]) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36]

        #  [> > > > >>>>>>>>>>>>],
        #  [|,>>>>>>>>>>>>>>, |],
        #  [|, 32, 33, 34, |, |],
        #  [|, 31, 36, 35, |, |],
        #  [|, <<<<<<<<<<< |, |],
        #  [|,<<<<<<<<<<<<<<< |]]


=begin
Create a function that takes an encryption key (a string with an even number of characters) and a message to encrypt. Group the letters of the key by two:

"gaderypoluki" -> "ga de ry po lu ki"

Now take the message for encryption. If the message character appears in the key, replace it with an adjacent character in the grouped version of the key. If the message character does not appear in the key, leave it as is. If the letter in the key occurs more than once, the first result is used. Create a function that takes an encryption key (a string with an even number of characters) and a message to encrypt. Group the letters of the key by two:

Return the encrypted message.
Examples

encrypt("ab c", "abc ab") ➞ "ba cba"
groups = ["a", "b"] [" ", "c"]
"ab c"
includes a -> a is replaced with b
includes b -> b replaced with a
includes ' '
includes a ->


encrypt("otorhinolaryngological", "My name is Paul") ➞ "Mr olme hs Plua"

encrypt("gaderypoluki", "This is an encrypted message") ➞ "Thks ks gn dncyrotde mdssgad"

*PROBLEM*
Input: 2 Strings (encryption key, message to encrypt)
Output: Encrypted string

Explicit Rules:
-If char does not appear in key, leave it as is
-Encryption key will always be an even number of chars

Implciit:
-

*DS*
Array to hold groups / iteration

*ALOGIRTHM*

-Group letters of encryption key by 2
  -Init groups variable to empty array
  -Init pair variable to empty array
  -Iterate through chars of encryption key
    -Add char to pair
    -If pair size is 2
      -Add pair to groups
      -Set pair to empty array


-Iterate through chars of second string argument
  -Iterate through grouped encryption letters
    -If group includes current char
      -Replace it with the other char in the group
    -Otherwise lave it alone

-Return new string
=end

def groups(str)
  groups = []
  pair = []

  str.each_char do |char|
    pair << char
    if pair.size == 2
      groups << pair
      pair = []
    end
  end

  groups
end


def encrypt(key, message)
  groups = groups(key)
  message.chars.map do |char|

    groups.each do |group|
     if group.include?(char)
      char = group.select { |ch| char != ch }.join
      break
     end
    end

    char
  end.join
end

# test cases
#p encrypt("gaderypoluki", "This is an encrypted message") == "Thks ks gn dncyrotde mdssgad"
 p encrypt("otorhinolaryngological", "My name is Paul") == "Mr olme hs Plua"
#   p encrypt("ab c","abc ab") == "ba cba"
#  p encrypt("1234567890", "1029384756") == "2910473865"

=begin
Given a string of digits, return the longest substring with alternating odd/even or even/odd digits. If two or more substrings have the same length, return the substring that occurs first.

Examples
longest_substring("225424272163254474441338664823") ➞ "272163254"
# substrings = 254, 272163254, 474, 41, 38, 23

longest_substring("594127169973391692147228678476") ➞ "16921472"
# substrings = 94127, 169, 16921472, 678, 476

longest_substring("721449827599186159274227324466") ➞ "7214"
# substrings = 7214, 498, 27, 18, 61, 9274, 27, 32
# 7214 and 9274 have same length, but 7214 occurs first.

*problem*
Input: string
Output: String

Explicit RUles:
-Return longest substring that has odd/even or /even/odd alternating digits
-If more than 1 has the same length, return the one that comes first

Implicit Rules:
-Input wont be empty
-Input will 0-9 str chars

*DS*
Array to hold substrings

*ALGORITHM*
Helper method
alternating?(String) -> Boolean
-Determine if first number is odd or even
-If its even, check if all even indexes are even numbers and odd indexes are odd numbers
-If its odd, check if all even idxs are odd numbers / odd idx are even nums

Helper method
all_substrings(String) -> Array
-Init alternating_subs to empty arr
  -Iterate from 0 up to (not include) string size (start idx)
  -Iterate from start idx up to (not include) string size( end idx)
  -Init current substring to input str slice at start to end idx
    -Check if current substring is alternating?
    -If it is, add to alternating_subs
-Return alternating_subs

Main method
-get all alternating substrings from helper method
-Return the size of the longest alternating substring
=end

def alternating?(str)
  str = str.to_i.digits.reverse

  odd_num = true
  odd_num = false if str[0].even?

  if odd_num
    str.each_with_index.all? do |num, idx|
      (idx.even? && num.odd?) || (idx.odd? && num.even?)
    end
  else
    str.each_with_index.all? do |num, idx|
      (idx.even? && num.even?) || (idx.odd? && num.odd?)
    end
  end
end

# p alternating?("23456")
# p alternating?("12345")
# p alternating?("12225")

def all_substrings(str)
  alternating_subs = []
  (0...str.size).each do |st|
    (st...str.size).each do |nd|
      current_sub = str[st..nd]
      alternating_subs << current_sub if alternating?(current_sub)
    end
  end
  alternating_subs
end

def longest_substring(str)
  alternating_subs = all_substrings(str).max_by { |s| s.size }
  #size = alternating_subs.max_by { |s| s.size }
#   alternating_subs.select do |substr|
#     substr.size == size
# end.first


end

# test cases
p longest_substring("844929328912985315632725682153") #== "56327256"
p longest_substring("769697538272129475593767931733") == "27212947"
p longest_substring("937948289456111258444958189244") == "894561"
p longest_substring("736237766362158694825822899262") #== "636"
p longest_substring("369715978955362655737322836233") #== "369"
p longest_substring("345724969853525333273796592356") == "496985"
p longest_substring("548915548581127334254139969136") == "8581"
p longest_substring("417922164857852157775176959188") == "78521"
p longest_substring("251346385699223913113161144327") == "638569"
p longest_substring("483563951878576456268539849244") == "18785"
p longest_substring("853667717122615664748443484823") == "474"
p longest_substring("398785511683322662883368457392") == "98785"
p longest_substring("368293545763611759335443678239") == "76361"
p longest_substring("775195358448494712934755311372") == "4947"
p longest_substring("646113733929969155976523363762") == "76523"
p longest_substring("575337321726324966478369152265") == "478369"
p longest_substring("754388489999793138912431545258") == "545258"
p longest_substring("198644286258141856918653955964") == "2581418569"
p longest_substring("643349187319779695864213682274") == "349"
p longest_substring("919331281193713636178478295857") == "36361"




=begin

Two students are giving each other test answers during a test. They don't want to be caught so they are sending each other coded messages.

For example one student is sending the following message: "Answer to Number 5 Part b". He starts with a square grid (in this example a 5x5 grid) and he writes the message down, including with spaces:

Answe
r to
Numbe
r 5 P
art b

[A r N r a], [n   u   r], [s t m 5 t], [w o b    ], [e   e P b]

He then starts writing the message down one column at a time, from the top to the bottom. The encoded message is now: "ArNran u rstm5twob  e ePb"

You are the teacher of this class. Your job is to decipher the messages and bust the students.
Task

Complete the function that takes one parameter (the encoded message) and return the original message.

Note: The length of the string is always going to be a perfect square.

Have fun !!!

*PROBLEM*
Input: string
Output: String

Rules
-Decode the input string
-Input size will always haev a perfect square root

Implicit:
-Empty str returns ""
-Str may contain a-z and 0-9

*DS*
Array to hold sub arrays

*ALGORITHM*
-Init grid variable to empty array
-Init row variable to empty array
-Init grid_size to:
  -Determine the square root of the input str size
-Create grid
  -Iterate through chars
  -Add char to row array
  -If row array is equal to grid size
    -Add row to grid array
    -Reset row to empty array

Main method
-Init decoded variable to empty str
-Get grid from helper method and reverse it
-Iterate from the size of the grid minus 1 down to 0 - index
  -Iterate through grid array
    -Add the char at current index to decoded
-Return decoded
=end

def create_grid(str)
  grid = []
  column = []
  grid_size = Math.sqrt(str.size).to_i

  str.each_char do |char|
    column << char
    if column.size == grid_size
      grid << column
      column = []
    end
  end
  grid
end

def decipher_message(str)
  grid = create_grid(str).reverse
  decoded = ''

  (grid.size - 1).downto(0).each do |idx|
    grid.each do |column|
      decoded << column[idx]
    end
  end

  decoded.reverse
end

# https://www.codewars.com/kata/5a1a144f8ba914bbe800003f/train/ruby

def snail(array)
  array.empty? ? [] : array.shift + snail(array.transpose.reverse)
end
p decipher_message('ArNran u rstm5twob  e ePb') == 'Answer to Number 5 Part b'
p decipher_message('ArNran u rstm8twob  e ePc') == 'Answer to Number 8 Part c'
p decipher_message("92287a76 585a2y0") == "97 a2a52278y8650"
p decipher_message("") == ""

=begin
Description

Middle Earth is about to go to war. The forces of good will have many battles with the forces of evil. Different races will certainly be involved. Each race has a certain worth when battling against others. On the side of good we have the following races, with their associated worth:

    Hobbits: 1
    Men: 2
    Elves: 3
    Dwarves: 3
    Eagles: 4
    Wizards: 10

On the side of evil we have:

    Orcs: 1
    Men: 2
    Wargs: 2
    Goblins: 2
    Uruk Hai: 3
    Trolls: 5
    Wizards: 10

Although weather, location, supplies and valor play a part in any battle, if you add up the worth of the side of good and compare it with the worth of the side of evil, the side with the larger worth will tend to win.

Thus, given the count of each of the races on the side of good, followed by the count of each of the races on the side of evil, determine which side wins.
Input:

The function will be given two parameters. Each parameter will be a string of multiple integers separated by a single space. Each string will contain the count of each race on the side of good and evil.

The first parameter will contain the count of each race on the side of good in the following order:

    Hobbits, Men, Elves, Dwarves, Eagles, Wizards.

The second parameter will contain the count of each race on the side of evil in the following order:

    Orcs, Men, Wargs, Goblins, Uruk Hai, Trolls, Wizards.

All values are non-negative integers. The resulting sum of the worth for each side will not exceed the limit of a 32-bit integer.
Output:

Return "Battle Result: Good triumphs over Evil" if good wins, "Battle Result: Evil eradicates all trace of Good" if evil wins, or "Battle Result: No victor on this battle field" if it ends in a tie.
Algorithms

*PROBLEM*
Input: 2 strings
Output: String

Explicit Rules:
-String will contain numbers
-Each number represents the count of that race
-Number values will be positive
-First string represents good side
-Second string represents evil side
-Return "Battle Result: Good triumphs over Evil" if good side wins
-Return "Battle Result: Evil eradicates all trace of Good" if evil side wins
-Return "Battle Result: No victor on this battle field" if its a tie

Implict Rules:
-Inputs wont be empty

*DATA STRUCTURE*
Hash to hold races/values
Array - iteration

*ALGORITHM*
-Init good_side variable to hash with indexes as keys, points as values
-Init bad_size variable to hash with the same

Helper method calc_score(string) -> Integer
-Init score variable to 0
-Iterate over chars and indexes of input 1
  -Convert char to integer
  -Multiply it by the value of current index key in hash
    -Add to (increment) score
-Return score

Main method
-Init good_score to calc_score(input1)
-Init bad_score to calc_score(input2)

-Compare the two scores and return the appropriate string
=end

def good_vs_evil(good_str, bad_str)
  good_side = (0..5).zip([1, 2, 3, 3, 4, 10]).to_h
  bad_side = (0..6).zip([1, 2, 2, 2, 3, 5, 10]).to_h

  good_score = 0
  bad_score = 0

  good_str.split(' ').each_with_index do |count, idx|
    count = count.to_i
    good_score += (good_side[idx] * count)
  end

  bad_str.split(' ').each_with_index do |count, idx|
    count = count.to_i
    bad_score += (bad_side[idx] * count)
  end

  if good_score > bad_score
    'Battle Result: Good triumphs over Evil'
  elsif good_score < bad_score
    "Battle Result: Evil eradicates all trace of Good"
  else
    'Battle Result: No victor on this battle field'
  end
end

# https://www.codewars.com/kata/52761ee4cffbc69732000738/train/ruby

# test cases
p good_vs_evil('1 0 0 0 0 0', '1 0 0 0 0 0 0') #== 'Battle Result: No victor on this battle field'
p good_vs_evil('0 0 0 0 0 10', '0 1 1 1 1 0 0') ==  'Battle Result: Good triumphs over Evil'
p good_vs_evil('0 0 0 0 0 10', '0 1 1 1 1 0 0') == 'Battle Result: Good triumphs over Evil'

# 5:04
# Every valid email consists of a local name and a domain name, separated by the '@' sign. Besides lowercase letters, the email may contain one or more '.' or '+'.

# For example, in "alice@leetcode.com", "alice" is the local name, and "leetcode.com" is the domain name.
# If you add periods '.' between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name. Note that this rule does not apply to domain names.

# For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.
# If you add a plus '+' in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered. Note that this rule does not apply to domain names.

# For example, "m.y+name@email.com" will be forwarded to "my@email.com".
# It is possible to use both of these rules at the same time.

# Given an array of strings emails where we send one email to each emails[i], return the number of different addresses that actually receive mails.



# Example 1:

# Input: emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
# Output: 2
# Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails.
# Example 2:

# Input: emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
# Output: 3

=begin
*PROBLEM*
Input: Array of strings
Output: Integer

Explicit Rules:
-Return number of valid email addresses
-

*DS*
Array to hold valid emails

*ALGORITHM*
-Init valid_emails variable to empty array
-Filter the local name of each email adress
-Iterate through input array
  -Split current email at @
  -Iterate over chars of the local name with indexes
    -Delete periods
    -If current char is a +, delete chars from current index to last index
  -Add email to valid_emails
-Return the unique count of valid_emails

=end

def f(email_arr)
  valid_emails = []
  email_arr.each do |email|
    email = email.split("@")
    local_name = email[0].delete(".")
    filtered_name = ''
    local_name.chars.each_with_index do |char, idx|
      break if char == "+"
      filtered_name << char
    end
    filtered_email = [filtered_name, email[1]].join("@")
    valid_emails << filtered_email
  end
  valid_emails.uniq.count
end

p f(["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]) #== 2
 p(f(["a@leetcode.com","b@leetcode.com","c@leetcode.com"])) #3
 p(f(["test.email+alex@leetcode.com","test.email.leet+alex@code.com"]))#2




# You're given an array of integers. You must return the number of 'arithmetic progressions' of size 3 that are possible from that list.

# In each progression, the differences between the elements must be the same.

# Example:
# [1, 2, 3, 5, 7, 9] ==> 5
# The above has 5 progressions, seen below:
# [1, 2, 3], [1, 3, 5], [1, 5, 9], [3, 5, 7], and [5, 7, 9]
=begin

=end

# All array elements will be unique and the array will be sorted.
=begin
*PROBLEM*
Input: Array of integers
Output:  Integer

Explicit Rules:
-Find the number of 'arithmetic progressions' that are size 3
-Find groups of 3 numbers whos left and right differences from the middle number are the same
-Array numbers will be unique and sorted

Implicit Rules:
-Input array wont be empty
-Input will only contain integers

*DATA STRUCTURE*
Array - to hold progressions / iteration

*ALGORITHM*
-Init results variable to empty array
-Iterate through the input array with indexes
  -Check if the difference between the number at current index plus 1 (center num) and current number (left)
   is the same as the difference of number at current index plus 2 (right)
  -if the differences are the same, add left center and right number as an array to results
  -Stop iteration if current index is input array size minus 3
-Return the size of results

-Init results variable to empty array
-Find all size 3 combinations of the input array
-Iterate over combinations
  -Check if diff between left and center is the same as center and right diff
  -If it is, add to results variable
-Return size of results
=end

def progressions(arr)
  results = []

  combinations = arr.combination(3).to_a
  combinations.each do |comb|
    left_diff = (comb[1] - comb[0]).abs
    right_diff = (comb[1] - comb[2]).abs
    results << comb if left_diff == right_diff
  end

  results.size
end


p progressions([1, 2, 3, 5, 7, 9])# // 5
 p progressions([1, 2, 3, 4, 5])#;    // 4
 p progressions([0, 5, 8, 9, 11, 13, 14, 16, 17, 19])# 10

function progressions(arr) {
  let count = 0;
  for (let i = 0; i < arr.length; i++) {
    let num1 = arr[i];
    for (let j = i + 1; j < arr.length; j++) {
      let num2 = arr[j];
      let diff = num2 - num1;
      let current = num2 + diff;
      for (let k = j + 1; k < arr.length; k++) {
        let num3 = arr[k];
        if (num3 === current) {
          count++;
          break;
        }
      }
    }
  }
  return count;
}



# You are given a 0-indexed string s that has lowercase English letters in its even indices and digits in its odd indices.

# There is a function shift(c, x), where c is a character and x is a digit, that returns the xth character after c.

# For example, shift('a', 5) = 'f' and shift('x', 0) = 'x'.
# For every odd index i, you want to replace the digit s[i] with shift(s[i-1], s[i]).

# Return s after replacing all digits. It is guaranteed that shift(s[i-1], s[i]) will never exceed 'z'.



# Example 1:

# Input: s = "a1c1e1"
# Output: "abcdef"
# Explanation: The digits are replaced as follows:
# - s[1] -> shift('a',1) = 'b'
# - s[3] -> shift('c',1) = 'd'
# - s[5] -> shift('e',1) = 'f'
# Example 2:

# Input: s = "a1b2c3d4e"
# Output: "abbdcfdhe"
# Explanation: The digits are replaced as follows:
# - s[1] -> shift('a',1) = 'b'
# - s[3] -> shift('b',2) = 'd'
# - s[5] -> shift('c',3) = 'f'
# - s[7] -> shift('d',4) = 'h'

=begin
*PROBLEM*
Input: String
Output: String

Explicit Rules:
-Input string even indexes will be lowercase letters a-z
  -Odd indexes will be numbers
-Replace odd indexes with letter that many positions past the previous letter
-Letters will never exceed z

Implicit Rules:
-Input wont be empty

*DATA STRUCTURE*
Hash - alphabet positions
Array - iteration

*ALGORITHM*
-Init alpha_positions variable to a hash with letters as keys, positions as values
-Split input str into array of chars
-Iterate over chars array
  -If character is a number
    -Find the alphabet position of the previous char
    -Add current number to the position
    -Replace current number with letter at new position
  -Otherwise leave char as is
-Return transformed string
=end
p f(a2b3c1d6) == "acbecddj"
def f(str)
  alpha_positions = ('a'..'z').zip(1..26).to_h

  str.chars.map.with_index do |char, idx|
    if ('0'..'9').include?(char)
      new_position = alpha_positions[str[idx - 1]] + char.to_i
      alpha_positions.key(new_position)
    else
      char
    end
  end.join
end

p f("a1c1e1")# "abcdef"
p f("a1b2c3d4e")# "abbdcfdhe"


# Have the method division_stringified(num1, num2) take both parameters being passed, divide num1 by num2, and return the result as a string with properly formatted commas.
#
# If an answer is only 3 digits long, return the number with no commas.
#
# Example: if num1 is 123456789 and num2 is 10000 the output should be "12,346".
#
# Note: 2 divided by 3 should return '1'

=begin 
*problem*
Input: 2 integers 
Output: string 

Explciit Rules:
-divide num1 by num2 
-insert commas where they should be 

Implicit Rules:
-

*DS*
Array to hold digits 

*ALGORITHM*
-Init new_string to emtpy string 

-Float divide num 1 by num 2
-Determine if division result should be rounded down or up
  Compare the difference of result minus result rounded up with: 
  difference of result minus result rounded down 
  If result is closer to result rounded up
    Round up the result 
  Else 
    Round it down 

-Return result as string if its 3 numbers or less
-Reverse and split result num into array of string digits
-Iterate through digits array with indexes
  -If index is a multiple of 3, add a , to new string 
  -Add digit to new string 
-Reverse new string and return it 
=end 

def rounding(num)
  round_up_diff = (num.ceil - num).abs
  round_down_diff = (num.floor - num).abs
  round_up_diff <= round_down_diff ? num.ceil : num.floor
end 

def division_stringified(num1, num2)
  new_str = []
  #div = num1 / num2 
  result = rounding(num1.to_f / num2).to_s
  # if div != 0 || div != 1
  #   result = result.ceil.to_s 
  # else
  #   result = result.floor.to_s
  # end 

  return result if result.size <= 3
  result.reverse.chars.each_with_index do |char, idx|
    new_str << ',' if idx % 3 == 0
    new_str << char 
  end 

  new_str = new_str.reverse
  new_str.pop if new_str.last == ','
  new_str.join
end 
#=============TRISHA
# def division_stringified(num1, num2)
#   result = num1.divmod(num2)

#   return 0 if result[1] == 1
#   if result[1].zero?
#     result = result[0].to_s
#   else
#     result = result[0] + 1
#   end
  
#   if result.to_s.size <= 3
#     result.to_s
#   else
#   # formatting
#   end
# end


p division_stringified(503394930, 43) #== "11,706,859"
 p division_stringified(100000, 1) #== "100,000"
 p division_stringified(6874, 67) == "103"
 p division_stringified(5, 2) == "3"
p division_stringified(1, 10) == "0"
p division_stringified(1, 30) == "0"
p division_stringified(2, 3) == "1"
p division_stringified(7, 3) == "2"

# Create a method that takes in a string 
# and outputs the same string processed in a particular way

# The method should insert ONLY after the first occurence of each characte rof the input string
# all the alphabet letters that:
# -are NOT in the original string 
# -come after the letter of the string you are processing 

# Eeach added letter should be in uppercase, the letters of the original string will always be in lowercase.

# Example:
# Input: "holly"
# missing letters: "a b c d e f g i j k m n p q r s t u v w x z"
# Output: "hIJKMNPQRSTUVWXZoPQRSTUVWXYZlMNPQRSTUVWXZlyZ"
# You dont need to validate input,
# the input string will always contain a certain amount of lowercase letters 
# (min 1, max 50)

def insert_missing_letters(str)
  new = ''
  str.chars.each do |char|
    if new.include?(char)
      new << char
      next 
    end 
    new << char 
    alphabet = (char.upcase.succ..'Z').to_a - str.upcase.chars
    alphabet.each { |alpha| new << alpha }
  end 
  new
end 

# p insert_missing_letters("holly") == "hIJKMNPQRSTUVWXZoPQRSTUVWXZlMNPQRSTUVWXZlyZ"
# p insert_missing_letters("hello") == "hIJKMNPQRSTUVWXYZeFGIJKMNPQRSTUVWXYZlMNPQRSTUVWXYZloPQRSTUVWXYZ"
# p insert_missing_letters("fred") == "fGHIJKLMNOPQSTUVWXYZrSTUVWXYZeGHIJKLMNOPQSTUVWXYZdGHIJKLMNOPQSTUVWXYZ"
# p insert_missing_letters("z") == "z"
# p insert_missing_letters("efgh") == "eIJKLMNOPQRSTUVWXYZfIJKLMNOPQRSTUVWXYZgIJKLMNOPQRSTUVWXYZhIJKLMNOPQRSTUVWXYZ"
