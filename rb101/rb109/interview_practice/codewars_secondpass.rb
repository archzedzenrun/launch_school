=begin 
Input: String 
Output: Array 

Explicit rules:
-Returns all substrings of the input string that are palindromes. (in an array)
-Palindrome words are case sensitive. "mom" is a palindrome. "Mom" is not.

Implicit rules:
-A palindrome is a word that is the same in reverse.
-A substring is a series of string characters that make up a larger string.

Data Structure: Array

Algorithm:
-Initialize a palindromes variable to an empty array.
-Find all the substrings of the input string that are at least 2 characters long.
-Check if each substring is a palindrome.
-If it is, add it to the palindromes variable.
-Return the palindromes variable.

-Helper method to find substrings that are 2 characters or greater in length:
-Initialize a substrings variable to an empty array.
-Iterate over a range of 0 up to but not including the size of the input string. This will act as the start index.
-On each iteration:
-  Iterate over a range of the start index up to but not including the size of the inputs string. This will act as the end index.
-  On each iteration:
-    Initialize a substring variable to the input string at the index range of the start index to the end index.
-    IF the substring size is greater than or equal to 2, add it to the substrings variable.
-Return the substrings variable.

-Helper method to determine if a string is a palindrome:
-Check if the input string is equal to itself in reverse.
-Return true or false.
=end 

# def substrings(string)
#   substrings = []

#   (0...string.size).each do |st_idx|
#     (st_idx...string.size).each do |end_idx|
#       substr = string[st_idx..end_idx]
#       substrings << substr if substr.size >= 2
#     end 
#   end 
  
#   substrings
# end 

# def palindrome?(string)
#   string == string.reverse
# end 

# def palindrome_substrings(string)
#   palindromes = []
#   substrings = substrings(string)

#   substrings.each do |substr|
#     palindromes << substr if palindrome?(substr)
#   end

#   palindromes
# end 

# p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# p palindrome_substrings("palindrome") == []
# p palindrome_substrings("") == []

=begin 
Explicit rules:
- Input: String 
- Output: String 
- Remove every other word from the input string.

Questions:
-Mutating the original string object or returning a new one?
-Does "every other word" start with removing the first or second word of the input string?

Implicit rules:

Examples:

Data Structure:

Algorithm:
=end 

=begin 
*PROBLEM*
Explicit Rules:
- A sequence starts with 2.
- A sequence will be consecutive even integers.
- The integers are grouped in rows. 
- Row number determines how many integers will be in that row.
  Examples:
  - Row 1 = 2 
  - Row 2 = 4, 6
  - Row 3 = 8, 10, 12
  - Row 4 = 14, 16, 18, 20

- Input: Integer representing a particular row number.
- Output: Integer represnting the sum of all integers in that row.

*EXAMPLES*
p solve(1) == 2   
Row 1 = 2
Sum is 2

p solve(2) == 10
Row 2 = 4, 6
Sum is 10

p solve(4) == 68
Row 4 = 14, 16, 18, 20
Sum is 68

*DATA STRUCTURE*
Nested arrays with each sub array representing each row.

*ALGORITHM*
1. Initialize a rows variable to an empty array.
2. Create a row array and add it to the rows variable.
   
3. Repeat step 2 until the rows variable contains the amount of rows indicated by the input integer 
4. Sum the final row and return the result.
  

=end 

# def create_row(start_int, row_length)
#   row = []
#   current_int = start_int 
#   until row.length == row_length
#     row << current_int
#     current_int += 2
#   end 
#   row
# end 

# # p create_row(2, 1) #== [2]
# # p create_row(4, 2) #== [4, 6]
# # p create_row(8, 3) #== [8, 10, 12]


# def solve(row_num)
#   rows = []
#   start_int = 2

#   (1..row_num).each do |current_row|
#     rows << create_row(start_int, current_row)
#     start_int = rows.last.last + 2
#   end 

#   rows.last.sum
# end 

# p solve(1) #== 2
# p solve(2) #== 10 
# p solve(4) #== 68
#==================================================
=begin 
*PROBLEM*
Explicit Rules:
-Input: Array of numbers.
-Find how many numbers in the input array are smaller than each number.
-When counting how many numbers are smaller, only count unique values.
  -Example: [8, 1, 1, 2] If current number is 8, only 2 numbers are smaller than it (1 is only counted once)
-Output: Array of integers, each representing how many numbers are smaller than each number in the input array.

Implicit Rules:
-Input array will only contain integers.
-What if the input array is empty?

*EXAMPLES*
p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4])
                            == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

*DATA STRUCTURE*
Array of integers

*ALGORITHM*
1. Initialize a counts variable to an empty array.
2. Iterate through the numbers of the input array. On each iteration:
3. Count how many numbers in the input array are smaller than the current number (do not count duplicates).
4. Add the count to the counts array.
5. Return the counts array.
=end 

# def smaller_numbers_than_current(array)
#   counts = []
#   array.each do |num|
#     counts << array.uniq.count { |n| n < num }
#   end 
#   counts
# end 

# p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
# p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
# p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
# p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
# p smaller_numbers_than_current([1]) == [0]
#===============================================
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

def closest_numbers(array)
  differences = {}

  array.each_with_index do |num1, num1_idx|
    array[num1_idx + 1..-1].each do |num2|
      current_difference = (num1 - num2).abs
      next if differences.keys.include?(current_difference)
      differences[current_difference] = [num1, num2]
    end
  end
  
  smallest_difference = differences.keys.min
  differences[smallest_difference]
end 

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 17]) == [12, 7]

=begin 
*PROBLEM*
Explicit Rules:
-INPUT: String 
-Input will always be lowercase letters.
-If the character in the string is whitespace, pass over it as if it were an empty seat. In other words, ignore spaces.
-Return an array of words (the input string), with the next letter capitalized in each word.
-OUTPUT: Array of words (the input string)

Implicit Rules:
-Return an empty array if the input string is empty.

*EXAMPLES*
p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
Input "hello" has 5 alphabetic letters.
Output array will have 5 copies of "hello"
 
p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]
Input " gap " has 5 characters but spaces are ignored so there are only 3 alphabetic characters.
Output array has 3 words 

*DATA STRUCTURE*
Array

*ALGORITHM*
-Determine how many alphabetic characters are in the input string.
=end 


=begin 
So you've found a meeting room - phew! You arrive there ready to present, and find that someone has taken one or more of the chairs!! You need to find some quick.... check all the other meeting rooms to see if all of the chairs are in use.

Your meeting room can take up to 8 chairs. need will tell you how many have been taken. You need to find that many.

Find the spare chairs from the array of meeting rooms. Each meeting room tuple will have the number of occupants as a string. Each occupant is represented by 'X'. The room tuple will also have an integer telling you how many chairs there are in the room.

You should return an array of integers that shows how many chairs you take from each room in order, up until you have the required amount.

example:

[['XXX', 3], ['XXXXX', 6], ['XXXXXX', 9], ['XXX',2]] when you need 4 chairs:

result -> [0, 1, 3] no chairs free in room 0, take 1 from room 1, take 3 from room 2. no need to consider room 3 as you have your 4 chairs already.

If you need no chairs, return "Game On". If there aren't enough spare chairs available, return "Not enough!".
=end 


=begin 
*PROBLEM*
Explicit Rules:
-INPUT:
 First argument: 
 Nested arrays, each array represents a room. 
 Each array will contain a string of Xs. Each X represents a person in that room.
 Each array will have an integer that represents how many chairs are available in each room.

 Second argument:
 Integer representing how many chairs are needed for your room.

 If second argument is 0, return "Game On"
 If there arent enough spare chairs from other rooms, return "Not Enough!"



*EXAMPLES*
p meeting([["XXX", 3], ["XXXXX", 6], ["XXXXXX", 9]], 4)== [0, 1, 3]
4 chairs are needed.
Room 1 has 3 chairs and 3 X's, 0 chairs are avialble.
Room 2 has 6 chairs and 5 X's, 1 chair available.
Room 3 has 9 chairs and 6 X's, 3 chairs available.

*DATA STRUCTURE*
Array 

*ALGORITHM*
-Determine how many people are in the other offices.
  -Represented by the size of the string in the nested array.
-Determine how many chairs are avaiable in each other office.
  -Represented by the second element of the nested array.
-Find the difference to determine how many chairs are left over.
  -The difference of the size of the string minus the second integer element.
  -Initialize an available chairs variable to an empty array.
  -Iterate through the nested arrays
    

-Take any leftover chairs until i have the amount needed.
=end 

def meeting(office_array, chairs_needed)
  return "Game On" if chairs_needed == 0
  available_chairs = []
  office_array.each do |office|
     chairs = office[1] - office[0].size
     
     if chairs >= 0 
      available_chairs << chairs
      break if available_chairs.sum == chairs_needed
     else 
      available_chairs << 0
     end
  
  end 
  available_chairs.sum < chairs_needed ? "Not enough!" : available_chairs
end 

 p meeting([["XXX", 3], ["XXXXX", 6], ["XXXXXX", 9]], 4)== [0, 1, 3]
 p meeting([["XXX", 1], ["XXXXXX", 6], ["X", 2], ["XXXXXX", 8], ["X", 3], ["XXX", 1]], 5)== [0, 0, 1, 2, 2]
  p meeting([["XX", 2], ["XXXX", 6], ["XXXXX", 4]], 0)== "Game On"
 p meeting([["XX", 2], ["XXXX", 6], ["XXXXX", 4]], 8)== "Not enough!"
p meeting([["XX", 2], ["XXXX", 6], ["XXXXX", 4]], 2)== [0, 2]

Testing for [["", 8], ["X", 0], ["XXXXXXXXXX", 8], ["XXXXX", 7], ["X", 3], ["XXXX", 6], ["XXXX", 10], ["", 5], ["XX", 10], ["X", 7], ["XXXXX", 6], ["XXXXXXXXXX", 8]] and 4
It should work for random inputs too -  Expected: [4], instead got: [8, 0, 0, 2, 2, 2, 6, 5, 8, 6, 1, 0]


=begin 
https://www.codewars.com/kata/57f625992f4d53c24200070e
Time to win the lottery!

Given a lottery ticket (ticket), represented by an array of 2-value arrays, you must find out if you've won the jackpot.

Example ticket:

[ [ 'ABC', 65 ], [ 'HGR', 74 ], [ 'BYHT', 74 ] ]

To do this, you must first count the 'mini-wins' on your ticket. Each subarray has both a string and a number within it. If the character code of any of the characters in the string matches the number, you get a mini win. Note you can only have one mini win per sub array.

Once you have counted all of your mini wins, compare that number to the other input provided (win). If your total is more than or equal to (win), return 'Winner!'. Else return 'Loser!'.

All inputs will be in the correct format. Strings on tickets are not always the same length.
=end 

=begin 
*PROBLEM*
Explicit Rules:
-INPUT: Nested array of 2 value arrays.
-Each sub array will contain a string and an integer.
-A mini win is determined by any of the string character codes matching the integer element.
-If the amount of mini wins is greater than or equal to integer argument, return 'Winner!', else 'Loser!'
-OUTPUT: String

Implicit Rules:
-Strings will be all upercase characters.

*EXAMPLES*
bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2) == 'Loser!'
A == 65, 1 miniwin

bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 1) == 'Winner!'

bingo([['HGTYRE', 74], ['BE', 66], ['JKTY', 74]], 3) == 'Loser!'

*DATA STRUCTURE*
array

*ALGORITHM*
-Intialize a miniwins variable set to 0.
-Iterate over each nested array.
  -Determine the value of each character in the first string element.
  -Determine if any characters have a value equal to the second integer element.
  -Add 1 to the miniwins variable if it does.
-Check if the miniwins variable is greater than or equal to the second integer argument.
-Return Winner or Loser.
=end 

def bingo(ticket, winning_number)
  miniwins = 0
  ticket.each do |number|
    if number[0].chars.any? { |char| char.ord == number[1] }
      miniwins += 1
  end
  end 
  miniwins >= winning_number ? "Winner!" : "Loser!"
end 

p bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 2)
p bingo([['ABC', 65], ['HGR', 74], ['BYHT', 74]], 1) == 'Winner!'

p bingo([['HGTYRE', 74], ['BE', 66], ['JKTY', 74]], 3) == 'Loser!'


=begin 
https://www.codewars.com/kata/58039f8efca342e4f0000023


*PROBLEM*
Explicit Rules:
-INPUT: String 
-Replace every letter with the letter that follows it in the alphabet. 

-Alphabet shoudl wrap around from Z to A.
-Capitalize any vowels.
-Lowercase any consonants.
-OUTPUT: String 

Implicit Rules: 
--Only alphabetic characters are changed.

*EXAMPLES*
changer('Cat30') == ('dbU30')
C -> lowercase d 
a -> lowercase b 
t -> upcase U 

*DATA STRUCTURE*
Array 

*ALGORITHM*
-Intialize a alphabet array to a-z.
-Iterate through each character and index of the input string.
-Transform the charater into the next alphabetic letter.
  -Find the index of the current character in the alphabet array.
  -Replace it with the character at the next index.
  If current characte is a z, replace it with an a 
-If the letter is a vowel:
  -Capitalize it.
-Else 
  -Lowercase it.
-Join the characters back into a string and return it.

=end 

def changer(string)
  alphabet = ('a'..'z').to_a
  string.downcase.chars.map do |char| 
    if char == 'z'
      char = 'A'
    elsif alphabet.include?(char)
    index = alphabet.index(char)
    char = alphabet[index + 1]
    'aeiou'.include?(char) ? char.upcase : char
    else 
      char 
    end 
  end.join 
end 

p changer('Cat30') #== ('dbU30')
p changer('Alice') == ('bmjdf')
p changer('sponge1') == ('tqpOhf1')
p  changer('Hello World') == ('Ifmmp xpsmE')
 p changer('dogs') == ('Epht')
p changer('z') ==('A')



=begin 

# Given a string
#   return a hash with the characters as keys (represented as symbols) and their index location in an array, sorted in ascending order.

=end

=begin 
*PROBLEM*
Explicit Rules:
-INPUT: String
-Return a hash with characters from the input string sorted in ascending order by their array index location. 
-OUTPUT: Hash 

*EXAMPLES*
p map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }

*DATA STRUCTURE*
HASH 

*ALGORTIHM*
-Initialize a hash variable to an empty hash 
-Iterate through the characters and indexes of the input string. # d
  -On each iteration, set the current character as a symbol in the hash variable. # :d
  -If the current character key already exists, add the current index to the value array. # :d => [0, 2], :o => [1, 3]
  -Else Set its index as the hash value in an array. # :d => [0]
-Sort the hash by value.
-Return the hash.
=end 

def map_letters(string)
 
  string.chars.each_with_index.with_object({}) do |(char, index), hash |
    char = char.to_sym
    hash.keys.include?(char) ? hash[char] << index : hash[char] = [index]
  end 
  
end 


p map_letters("dodo") == { :d=>[0, 2], :o=>[1, 3] }
p map_letters("froggy") == { :f => [0], :r=>[1], :o=>[2], :g=>[3, 4], :y=>[5] }
p map_letters("grapes") == { :g=>[0], :r=>[1], :a=>[2], :p=>[3], :e=>[4], :s=>[5] }
p map_letters('') == {}
p map_letters('Garboj Fartoogenwinkle') == {:G=>[0], :a=>[1, 8], :r=>[2, 9], :b=>[3], :o=>[4, 11, 12], :j=>[5], :" "=>[6], :F=>[7], :t=>[10], :g=>[13], :e=>[14, 21], :n=>[15, 18], :w=>[16], :i=>[17], :k=>[19], :l=>[20]}


=begin 
*PROBLEM*
Explicit Rules:
-INPUT: String, Integer
-Concatenate odd indexed characters of the input string with the even indexed characters of the input string.
-Repeat the process as many times indiciated by the integer argument.
-If input string is empty return the string argument.
-If the integer argument is less than 0, return the string argument.
-OUTPUT: String 

Implicit Rules:

*EXAMPLES*
encrypt("012345", 1)  =>  "135024"
0-0, 1-1, 2-2, 3-3, 4-4, 5-5
odd container = 1 3 5
even container = 0 2 4
odd container + even container = 135024

odd container = 3 0 4
even container = 1 5 2
odd + even = 304152

odd = 0 1 2
even = 3 4 5
odd + even 012345

encrypt("012345", 2)  =>  "135024"  ->  "304152"
encrypt("012345", 3)  =>  "135024"  ->  "304152"  ->  "012345"

*DATA STRUCTURE*
Arrays

*ALGORITHM*
-Initialize a encrypted_string variable to the input string. # "012345" | ["1", "3", "5", "0", "2", "4"] | 3 0 4 1 5 2
-Do this as many times indicated by the integer argument:
-Initialize an odd_index variable to the result of selecting the odd indexed numbers of the encryped_string variable. # ["1", "3", "5"] | 3 0 4
-Initialize an even_index variable to the result of selecting the even indexed numbers of the encrypted_string variable. # ["0", "2", "4"] | 1 5 2
-Set the encrypted_string variable to the result of concatenating odd_index and even_index. # encrypted_string = odd_index + even_index

-Join the encrypted_string array into a string.
-Return the string.

-Decryption:

Example:
decrypt("hsi  etTi sats!", 1)
odd idx = h s i " " " " e t 
even idx = T i " " s a t s !

0 from even - T 
0 from odd - h 
1 from even - i 
1 from odd - s 

*ALGORITHM*
-Initialize a decrypted_str variable to the chars of the input string.
-Separate the encrypted input string into its even and odd indexed characters.
  -Intialize an odd index variable to the input string at the range of 0 to the size of the string / 2
  -Initailize an even index variable to the input string at hte range of the size of the string / 2 to the last index (-1)
-As many times as indicated by the input integer: 
  -Iterate over a range of 0 to the size of the input string / 2. This will act as the index.
  -On each iteration:
    -Add the character at the current index from the even variable to the decryped str variable.
    -Add the character at the current index from the odd variable to the decryped str variable.
-Join the decrypted_str variable into a string 
-Return the string 
=end 

def encrypt(text, n)
  encrypted_str = text.chars

  n.times do
    odd_index = encrypted_str.select.with_index { |_, idx| idx.odd? }
    even_index = encrypted_str.select.with_index { |_, idx| idx.even? }
    encrypted_str = odd_index + even_index
  end 

  encrypted_str.join
end 

def decrypt(text, n)
  decrypted_str = text # "hsi  etTi sats!" | # "This is a test!"

  n.times do 
    odd_index = decrypted_str[0...text.size / 2] # "hsi  et"
    even_index = decrypted_str[text.size / 2..-1] # "Ti sats!"
    unscrambled = ''

    even_index.chars.each_with_index do |char, idx| # ["T", "i", " ", "s", "a", "t", "s", "!"]
      unscrambled << char unless char == nil # unscrambled = 'T'
      unscrambled << odd_index[idx] unless odd_index[idx] == nil # unscrambled = 'Th'
    end 

    decrypted_str = unscrambled # "This is a test!"
  end
  
  decrypted_str
end

# p encrypt("012345", 2)
# p encrypt("This kata is very interesting!", 1)
p encrypt("This is a test!", 3) == " Tah itse sits!"
p decrypt(" Tah itse sits!", 3) == "This is a test!"




=begin 
Fold 1-times:
[1,2,3,4,5] -> [6,6,3]
0 1 *2* 3 4

[1, 2]

[5, 4]

[ -9, 9, -8, 8, 66, 23 ]
[-9, 9, -8]
[23, 66, 8]

A little visualization (NOT for the algorithm but for the idea of folding):

 Step 1         Step 2        Step 3       Step 4       Step5
                     5/           5|         5\          
                    4/            4|          4\      
1 2 3 4 5      1 2 3/         1 2 3|       1 2 3\       6 6 3
----*----      ----*          ----*        ----*        ----*


Fold 2-times:
[1,2,3,4,5] -> [9,6]

*PROBLEM*
Explicit Rules:
-INPUT: 
-First argument: Array of numbers
-Second argument: Amount of folds
-If the array has one number, return the array.
-If the count of number is odd, middle number stays the same.
-If the count of numbers is even, the "fold point" is between the middle numbers.
-Output: Array 

*DATA STRUCTURE*
Arrays

*ALGORITHM*
-Find the middle point of the input array.
-As many times indicated by the second integer argument:
-If the size of the input array is odd:
  -Store the middle the number - array.size / 2  array[index]
  -Store the left side of the array from the middle index - 0...2
  -Store the right side of the arary - array.size / 2 + 1..-1
    -Reverse array 
  -Add the numbers from the left side and right side at the same indexes. 
    -Add the middle number onto the end of the result.

-If the size of the input array is even:
  -Store the left side ot he array from 0 index up to but not including the middle index ( arr.size / 2)
  -Store the right side from the middle index to the last index.
    -Reverse array 
  -Add the numbers from the left and right side at the same indexes.
=end 





def fold_array(nums_arr, folds)
  folded_arr = nums_arr
  folds.times do 
    middle_index = folded_arr.size / 2
    left_side = folded_arr[0...middle_index]
    right_side = folded_arr.size.odd? ? folded_arr[middle_index + 1..-1].reverse : folded_arr[middle_index..-1].reverse
    temp_arr = []
    left_side.each_with_index do |num, idx|
      temp_arr << num + right_side[idx]
    end 
    temp_arr << folded_arr[middle_index] if folded_arr.size.odd?
    folded_arr = temp_arr
  end
  folded_arr
end 


input = [ 1, 2, 3, 4, 5 ]
expected = [ 6, 6, 3 ]
p fold_array(input, 1) == expected
    
expected = [ 9, 6 ];
p fold_array(input, 2) == expected
    
expected = [ 15 ];
p fold_array(input, 3)== expected

input = [ -9, 9, -8, 8, 66, 23 ]
expected = [ 14, 75, 0 ]
p fold_array(input, 1)== expected

p fold_array([1, 2, 3, 2], 1)





=begin
John and Mary want to travel between a few towns A, B, C ... Mary has on a sheet of paper a list of distances between these towns. ls = [50, 55, 57, 58, 60]. John is tired of driving and he says to Mary that he doesn't want to drive more than t = 174 miles and he will visit only 3 towns.

Which distances, hence which towns, they will choose so that the sum of the distances is the biggest possible to please Mary and John?

Example:
With list ls and 3 towns to visit they can make a choice between: [50,55,57],[50,55,58],[50,55,60],[50,57,58],[50,57,60],[50,58,60],[55,57,58],[55,57,60],[55,58,60],[57,58,60].

The sums of distances are then: 162, 163, 165, 165, 167, 168, 170, 172, 173, 175.

The biggest possible sum taking a limit of 174 into account is then 173 and the distances of the 3 corresponding towns is [55, 58, 60].

The function chooseBestSum (or choose_best_sum or ... depending on the language) will take as parameters t (maximum sum of distances, integer >= 0), k (number of towns to visit, k >= 1) and ls (list of distances, all distances are positive or zero integers and this list has at least one element). The function returns the "best" sum ie the biggest possible sum of k distances less than or equal to the given limit t, if that sum exists, or otherwise nil, null, None, Nothing, depending on the language. In that case with C, C++, D, Dart, Fortran, F#, Go, Julia, Kotlin, Nim, OCaml, Pascal, Perl, PowerShell, Reason, Rust, Scala, Shell, Swift return -1.

Examples:
ts = [50, 55, 56, 57, 58] choose_best_sum(163, 3, ts) -> 163

xs = [50] choose_best_sum(163, 3, xs) -> nil (or null or ... or -1 (C++, C, D, Rust, Swift, Go, ...)

ys = [91, 74, 73, 85, 73, 81, 87] choose_best_sum(230, 3, ys) -> 228

Notes:
try not to modify the input list of distances ls
in some languages this "list" is in fact a string (see the Sample Tests).
=end 

=begin 
*PROBLEM*
Explicit Rules:
-INPUT:
-Integer representing max sum of distances. 
-Integer representing the numbe rof towns to visit.
-Array of integers each representing a distance.

-Distances are positive integers 
-Distances may be 0
-Array will have at least 1 element.
-Return the biggest possible sum based on how many towns are being visited (second input argument)
-Return nil if there is no biggest sum
-OUTPUT: Integer or nil 

*EXAMPLES*
ts = [50, 55, 56, 57, 58] choose_best_sum(163, 3, ts)

*DATA STRUCTURE*
Arrays
Hash

*ALGORITHM*
-Helper method: Find all posibile combinations of the input array. 
  -Combination sizes will be based on the second input argument. (number of towns)
  -Input: Array and integer indicating the size of sub arrays.
    -Find all subarrays whos size are equal to the second argument.
  -Output: Array of subarrays

-Main method: 
  -Invoke the subarrays helper method to get all subarrays.
  -Transform each subarray into its sum.
  -Find the subarray sum that is less than or equal to the first input argument.
  -Return that value or nil if there is no biggest sum.
=end 



def choose_best_sum(max_sum, num_towns, distances_arr)
  distances = distances_arr.combination(num_towns).to_a
  sums = distances.map(&:sum).reject { |distance| distance > max_sum }
  return nil if sums.empty?
  hash = {}
  sums.each do |sum|
    hash[sum] = (max_sum - sum).abs
  end 
  hash.min_by { |_, value| value }[0]
end 



# test cases

ts = [50, 55, 56, 57, 58]
p choose_best_sum(163, 3, ts) == 163
ts = [50]
p choose_best_sum(163, 3, ts) == nil
 ts = [91, 74, 73, 85, 73, 81, 87]
 p choose_best_sum(230, 3, ts) == 228



Algorithm:
-Iterate through the charaters of the first word of the array.
-Find the count of the current character in each word of the input array.

def common_chars(array)
letters = []
 word = array[0].chars
word.each do |char|
	array.each do |word|
		letters << char * word.count(char)
	end 
letters
end 


=begin 
40 MIN AND DID NOT SOLVE
Given array of strings made only of lowercase letters, return array of all characters that show up in all strings within the given array (including duplicates) For example, if a character occurs 3 times in all strings, but not 4 times, you need to include that character three times in the final answer.

=end 

=begin 
Goal: return an array of letters that are present in every string in the input.  If letter occurs twice or more in each, then the return shall have 2 of that letter, or more. 

input: array of lowercase strings
output: array of letters ocurring in all elements 

rules:
all lowercase 
letter returns will be consistant with letter quantities 
no spaces 

examples below 
Data Structure:
arrays 

Algorithm:
split all words into sub-arrays temporarily by letter and count the letter that is currently available 
return an array with all the counts, and choose the minimum, and multiply that by the current letter pushing into a return array 

=end 

# def common_chars(array)
# index = 0
# quantity_array = []
# letter = ''

#   loop do
#   return_array = array.map do |ele|
#     (ele.split(//).count(ele[index]))
#     end
#     p return_array
#   p  min_num = (return_array - [0]).min

#     if quantity_array.include?(array[0][index])
#     index += 1
#       next
#     else
#       quantity_array << array[0][index] * min_num
#     end
#     break if index == array[0].length - 1
#     index += 1

#   end
#   quantity_array
#   # return_array
# end


# p common_chars(['cool', 'lock', 'cook']) #== ['c', 'o']
#p common_chars(['hello', 'goodbye', 'booya', 'random']) #== ['o']
# p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz)) == []

# Iterate through each char 
#   Iterate through each word 
#     map each word to count of current char 

def common_chars(array)
  word = array[0]
  letters = []

  word.chars.each do |char|
  
    count = array.map do |word|
      word.count(char)
    end.min
  if letters.include?(char)
    next
  end
    count.times do
    letters << char
end
  end
  letters
end 

p common_chars(['hello', 'goodbye', 'booya', 'random'])
p common_chars(['cool', 'loock', 'cook'])
p common_chars(%w(aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz))




=begin 

Prior to having fancy iPhones, teenagers would wear out their thumbs sending SMS messages on candybar-shaped feature phones with 3x4 numeric keypads.

------- ------- -------
|     | | ABC | | DEF |
|  1  | |  2  | |  3  |
------- ------- -------
------- ------- -------
| GHI | | JKL | | MNO |
|  4  | |  5  | |  6  |
------- ------- -------
------- ------- -------
|PQRS | | TUV | | WXYZ|
|  7  | |  8  | |  9  |
------- ------- -------
------- ------- -------
|     | |space| |     |
|  *  | |  0  | |  #  |
------- ------- -------
Prior to the development of T9 (predictive text entry) systems, the method to type words was called "multi-tap" and involved pressing a button repeatedly to cycle through the possible values.

For example, to type a letter "R" you would press the 7 key three times (as the screen display for the current character cycles through P->Q->R->S->7). A character is "locked in" once the user presses a different key or pauses for a short period of time (thus, no extra button presses are required beyond what is needed for each letter individually). The zero key handles spaces, with one press of the key producing a space and two presses producing a zero.

In order to send the message "WHERE DO U WANT 2 MEET L8R" a teen would have to actually do 47 button presses. No wonder they abbreviated.

For this assignment, write a module that can calculate the amount of button presses required for any phrase. Punctuation can be ignored for this exercise. Likewise, you can assume the phone doesn't distinguish between upper/lowercase characters (but you should allow your module to accept input in either for convenience).

Hint: While it wouldn't take too long to hard code the amount of keypresses for all 26 letters by hand, try to avoid doing so! (Imagine you work at a phone manufacturer who might be testing out different keyboard layouts, and you want to be able to test new ones rapidly.)

=end 

=begin 
*PROBLEM*
Explicit Rules:
-INPUT: String 
-Ignore punctuation.
-Upper and lowercase are considered the same
-OUTPUT: Integer representing how many key presses

*EXAMPLES*
"LOL"
3 3 3

{ 5 => [J, K, L] }
        0 1 2  + 1


*DATA STRUCTURE*
Hash 

*ALGORITHM*
-Intialize a press_count variable to 0.
-Iterate through the downcased chars of the input string.
-On each iteration:
  -Iterate through the hash keys
  -Check if the hash at the current key includes the current character 
    -If it does, increment the press_count by the index position of the current character plus one.
-Return the press_count
=end 

def presses(string)
  hash = {0 => [' '], 2 => %w(a b c), 3 => %w(d e f), 4 => %w(g h i), 5 => %w(j k l), 6 => %w(m n o), 7 => %w(p q r s),
          8 => %w(t u v), 9 => %w(w x y z) }
  press_count = 0

  string.downcase.each_char do |char|
    hash.keys.each do |key|
      if hash[key].include?(char)
        press_count += hash[key].index(char) + 1
      end 
    end 
  end 

  press_count
end 







p presses("LOL") #== 9
p presses("HOW R U") == 13


=begin 
https://www.codewars.com/kata/550554fd08b86f84fe000a58/train/ruby
Which are in?

Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.
Example 1:
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns ["arp", "live", "strong"]

Example 2:
a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns []

Notes:
    Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
    In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
=end 

=begin 
*PROBLEM*
Explicit RUles:
-INPUT: Two arrays of strings 
-Find which strings of arr1 are substrings of strings in arr2
-OUTPUT: Array 

Implicit Rules:
-Return an empty array if no strings in arr2 are substings of strings in arr2

*EXAMPLES*
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

*DATA STRUCTURE*
Arrays 

*ALGORITHM*
-Initialize an empty array called substrings 
-Iterate through the second array input # "lively"
  -On each iteration:
    -Check if any of the strings in first array are included in the current word. # "arp", "live", "strong"
    -If they are, add the string to substrings. # live
-Remove duplicates from substrings and sort by alphabetic order
-Return substrings 
=end 

def in_array(arr1, arr2)
  arr2.each_with_object([]) do |arr2_word, substrings|
    arr1.each do |arr1_word|
      substrings << arr1_word if arr2_word.include?(arr1_word)
    end 
  end.uniq.sort
end 



a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
p in_array(a1, a2) == ["arp", "live", "strong"]
a1 = ["tarp", "mice", "bull"]
p in_array(a1, a2) == []



=begin 
https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby

Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the english alphabet letters.

Example:
alphabetized("The Holy Bible") # "BbeehHilloTy"

=end 
=begin 
*PROBLEM*
Explicit Rules:
-INPUT: String 
-Reorder the characters into new string
-New string is case insensitive, alphabetical order, order of appearance
-White space and punctuation will be removed.
-OUTPUT: String 

*EXAMPLE*
p alphabetized("A b B a")
AbBa 
A a 
b B 

A a b B 

*DS*
Array 

*ALGORITHM*
-Initialize new string to empty string.
-Iterate through the chars of the alphabet.
  -On each iteration:
    -Iterate through the chars of the input string. 
    -On each iteration: 
      -If the current char (lower or uppercase) is equal to the current alphabet char 
        -Add it to the new string 
-Return new string 

=end 

# def alphabetized(str)
#   alphabet = ('a'..'z').to_a 
  
#   alphabet.each_with_object([]) do |alpha_char, new_str| # a A
#     str.chars.each do |str_char|
#       if str_char == alpha_char || str_char == alpha_char.upcase
#         new_str << str_char
#       end 
#     end 
#   end.join

# end 

=begin 
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou. 
=end 

=begin 
*PROBLEM*
Explicit Rules:
-INPUT: String 
-String will be alpha chars only
-No spaces
-Return length of longest vowel substring
-OUTPUT: String 

*EXAMPLES*
"codewarriors"
vowel substrings:
o 
e 
a 
i 
io - longest 2 
o 

*DS*
Array

*ALGORITHM*
-Iniitalize longest_substr variable.
-Initialize new string to empty string.
-Iterate through chars of the input str.
   If current char is a vowel, 
     save it in new string 
     add sive of new string to longest_substr  
   If not
     Set new_str back to empty
-Return longest_substr
=end 


def solve(str)
  longest_vowel_substr = 0
  vowel_str = 0

  str.chars.each do |char|
    if 'aeiou'.include?(char)
      vowel_str += 1
      longest_vowel_substr = vowel_str if vowel_str > longest_vowel_substr
    else
      vowel_str = 0
    end
  end

  longest_vowel_substr
end 

 p solve("codewarriors") #== 2
 p   solve("suoidea") == 3
p  solve("iuuvgheaae") #== 4
 p  solve("ultrarevolutionariees") == 3
  p  solve("strengthlessnesses") == 1
 p  solve("cuboideonavicuare") == 2
 p  solve("chrononhotonthuooaos") == 5
p  solve("iiihoovaeaaaoougjyaw") == 8


=begin 
In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

*PROBLEM*
Explciit Rules:
-INPUT: String 
-Return a hash with percentage of lowercase/uppercase/neither chars 
-OUTPUT: Hash 

Implicit:
-Spaces are other chars 

*EXAMPLES*
('abCdef 123') -> 10
abdef - 5 
C - 1
neither - 4

*DATA STRUCTURE*
Hash 

*ALGORITHM*
-Create a hash with lowercase uppercase and neither keys 
-Count the number of lowercase chars in input str 
  -Count how many chars in input are included in a-z
  -Add the % to the lowercae hash key 
-Count the number of uppercase chars in input str 
  -Count how many chars in input are included in A-Z
  -Add the % to the uppercase hash key 
-To find count of neither - add lowercase and uppercase counts together and substract them from size of input
  -Add % to the neither hash key 
=end 

def letter_percentages(str)
  percent_hash = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  lowercase_count = str.chars.count { |char| ('a'..'z').include?(char) }
  upcase_count = str.chars.count { |char| ('A'..'Z').include?(char) }
  neither = str.size - (lowercase_count + upcase_count)

  percent_hash.each do |key, percent|
    case key 
    when :lowercase then percent_hash[key] = (lowercase_count * 100) / str.size.to_f
    when :uppercase then percent_hash[key] = (upcase_count * 100) / str.size.to_f 
    when :neither   then percent_hash[key] = (neither * 100) / str.size.to_f 
    end
    # [key, new_val_computtion].to_h
  end
  
  percent_hash
end 

=begin 
*PROBELM*
Explicit Rules:
-INPUT: String 
-First and last chars stay in original spots 
-All other chars sorted alphabetically
-Punctuation stays in its original spots
-OUTPUT: String

Implicit Rules:
-Empty input returns empty string 
-2 and 3 size input returns itself
-First and last chars means alphabetic chars, if str starts with punctuation, that doesnt count as the first char.
-will there be uppercase chars?
-are chars case sensitive?

*DATA STRUCTURE*
Hash
Array 

*ALGORITHM*
   -Initialize a hash to store punctuations.
   -Intialize a new string to hold alpha chars.
1. Store non alpha chars and their positions in a hash.
   -Iterate over the input string.
     -If char is an alpha char, add it to the new string.
     -Else set its index as a hash key and the char as a value.

3. Sort the remaining alpha chars alphabetically, leaving the first and last alone. 
   -Sort the chars in new string between the first and last index 
     *-Save the first and last chars in a variable.
      -Delete them from the new string.
      -Sort the remaining chars.
      -Add the saved first and last chars back at the first and last index.
4. Add punctuations back in their original positions.
   -Iterate over the punctuations hash.
   -Insert the current value at the current key index.
   -Return the new string.
=end 

def scramble_words(str)
  alpha_chars = ('a'..'z').to_a
  
  str.split.map do |word|

    punctuations = {}
    new_str = []

    word.chars.each_with_index do |char, idx|
      alpha_chars.include?(char) ? new_str << char : punctuations[idx] = char
    end 

    sorted_chars = new_str[1...-1].sort.join
    sorted_str = new_str.first + sorted_chars + new_str.last

    punctuations.each do |idx, punctuation|
      sorted_str.insert(idx, punctuation)
    end 
    
    # sorted_str
    word.size == 1 ? new_str : sorted_str
  end.join(' ')
end 

p scramble_words('professionals') == 'paefilnoorsss'
 p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramble_words('card-carrying') == 'caac-dinrrryg'
 p scramble_words("shan't") == "sahn't"
 p scramble_words('-dcba') == '-dbca'
 p scramble_words('dcba.') == 'dbca.'
 p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."
p scramble_words("won't creative ninety-nine verisimilitude. antediluvian supra-chiasmatic a he's he's discombobulate")
p scramble_words("no, a. callipygian sun zig-zag,")

=begin *COMPLETED IN 30-35 MINS*

Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.
Assumptions:

    A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII.
    Apostrophes can appear at the start, middle or end of a word ('abc, abc', 'abc', ab'c are all valid)
    Any other characters (e.g. #, \, / , . ...) are not part of a word and should be treated as whitespace.
    Matches should be case-insensitive, and the words in the result should be lowercased.
    Ties may be broken arbitrarily.
    If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.

Examples:

top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.")
# => ["a", "of", "on"]

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]

top_3_words("  //wont won't won't")
# => ["won't", "wont"]

*PROBLEM*
Explicit Rules:
-INPUT: String 
-Find the top 3 most occuring words in the string, sorted by most occurrences.
-A word can contain a-z and apostrophe,
-All other chars should be treated as whitespace.
-Treat words as case insensitive (upper and lowercase are the same).
-Return empty array if input is empty .
-If there are less than 3 words, return the top 2 or 1.

Implicit Rules:
-Words are determined by spaces in the string.

*EXAMPLES*
top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
# => ["e", "ddd", "aa"]
"e" occurs 7 times 
"ddd" or "DDD" occurs 5 times 
"aa" "Aa" or "aA" occurs 3 times 

top_3_words("  //wont won't won't")
# => ["won't", "wont"]
won't occurs 2 times
wont occurs 1 time 

*DATA STRUCTURE*
Array
Hash to keep track of word counts

*ALGORITHM*
    -Initalize a word_count hash.
1.  Go through each word and remove anything that isnt ' or a-z.
    -Split the input str into an array of words.
    -Iterate through the array of words:
      -Iterate through the chars of the current word:
        -Add a-z or apostrophe chars to a temp string.
        -Add the temp string as a key in the word count hash and increment its value by 1.
2.  Keep track of the count of each of word.

3.  Find the top 3 (or less) words that occur most often, sorted by occurence.
    -Sort the word count hash by highest values (counts)
    -Return an array containing the top 3 values.
=end 

def valid_char?(str)
  valid_chars = ('a'..'z').to_a + ["'"]
  valid_chars.include?(str)
end 

def top_3_words(str)
  word_count = Hash.new(0)
  words_arr = str.split
  
  words_arr.each do |word|
    temp_word = ''

    word.downcase.chars.each do |char|
      temp_word << char if valid_char?(char)
    end
    
    word_count[temp_word] += 1 unless temp_word.all? { |char| char == "'" } ||  temp_word.size < 1
  end 

  result = []
  word_count.sort_by { |_, count| -count }.each do |word, _|
    break if result.size == 3
    result << word
  end

  result
end 

def top_3_words(string)
  alpha = ('a'..'z').to_a + ["'"]
  word_count = {}

  words = string.downcase.split.map do |word|
    word.chars.select do |char|
      alpha.include?(char) 
    end.join
  end 

  words = words.delete_if { |word| word.chars.all? { |char| char == "'" } }
  words.each { |word| word_count[word] = words.count(word) if !word.empty? }

  result = []
  word_count.sort_by { |_, count| -count }.each do |word, _|
    break if result.size == 3
    result << word
  end
  result
end 
p top_3_words("  //wont won't won't") == ["won't", "wont"]
p top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e") == ["e", "ddd", "aa"]
p top_3_words("In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income.") == ["a", "of", "on"]
p top_3_words("  , e   .. ")
p top_3_words("  '''  ")
p top_3_words("a a c b b")




# Create a program that will take in a string as input and, if there are duplicates of more than two alphabetical characters in the string, returns the string with all the extra characters in a bracket.

# For example, the input "aaaabbcdefffffffg" should return "aa[aa]bbcdeff[fffff]g"

# Please also ensure that the input is a string, and return "Please enter a valid string" if it is not.

=begin 
*PROBLEM*
Explicit Rules:
-INPUT: String 
-Add bracks around duplicate chars of more than 2.
-OUTPUT: String 

*EXAMPLES*
p string_parse("aaaabbcdefffffffg")
p string_parse("boopdedoop")
p string_parse("helloo[o]kat")

*DATA STRUCTURE*
Array 

*ALGORITHM*
-Initialize an empty array - new_str 
1. Go through each character of the string 
     -Add it to the new_str
     -If the last 2 chars of new_str are equal to current char # [a, a, [, a, a , ], 
       -Add a [ before the current char
       -If the current char is not equal to the next char 

-Intiailize a new_str '"aa[a]"
-Iterate through a-z
  -Intialize temp str ''
  -On each iteration:
  -Iterate through the chars of the input string.
  -If current char is equal to a-z char 
    -Add it to temp str
    -If temp str size is greater than 2, insert a [ at 2 index and a ] at the last index.
       -Add temp str to new_str 
    -Else
       -Add temp str to new_str 
-Return new_str
=end 

def string_parse(str)
  new_str = ''
  ('a'..'z').each do |alpha_char|
    temp_str = ''
    str.each_char do |char|
      if char == alpha_char
        temp_str << char
      end 
      
      
    end 
    if temp_str.size > 2
      temp_str.insert(2, '[')
      temp_str.insert(-1, ']')
    end 
    new_str << temp_str
  end 
  new_str
end 

p string_parse("aaaabbcdefffffffg") == "aa[aa]bbcdeff[fffff]g"
 p string_parse("boopdedoop") #== "boopdedoop"
p string_parse("helloookat") #== "helloo[o]kat"

=begin 
*ALGORITHM*
-Initialize new_str to empty Str
-Initialize temp_str to empty str 
-Iterate through chars of input str 
  -If last char of temp str isnt the same as current char
      -If temp_str size is more than 2
        -Add [ after the first 2 chars
        -Add ] at the end of temp_str  
    -Add temp_str to new_str 
    -Set temp_str back to empty str 
  -Add current char to temp_str on each iteration
-Return new_str

=end 

def string_parse(str)
  new_str = ''
  temp_str = ''

  str.each_char do |char|
    if temp_str[-1] != char

      if temp_str.size > 2
        temp_str.insert(2, '[')
        temp_str.insert(-1, ']')
      end

      new_str << temp_str 
      temp_str = '' 
    end

    temp_str << char 
  end 
  
    new_str
end 

p string_parse("aaaabbcdefffffffg")
p string_parse("boopdedoop") #== "boopdedoop"
p string_parse("helloookat") #== "helloo[o]kat"


def delete_nth(arr, n)
  new_arr = []
  arr.each do |num|
    new_arr << num unless new_arr.count(num) > n
  end 
  new_arr
end 


def string_parse(str)
  new_str = ''
  temp_str = ''

  str.each_char.with_index do |char, idx|

    if temp_str[-1] != char

      if temp_str.size > 2
        temp_str.insert(2, '[')
        temp_str.insert(-1, ']')
      end

      new_str << temp_str 
      
      temp_str = ''
      
    end
    
    temp_str << char 
    new_str << temp_str if idx == str.size - 1
  end 
    
    new_str
end 







=begin 
https://www.codewars.com/kata/55aa075506463dac6600010d

1, 246, 2, 123, 3, 82, 6, 41 are the divisors of number 246. Squaring these divisors we get: 1, 60516, 4, 15129, 9, 6724, 36, 1681. The sum of these squares is 84100 which is 290 * 290.

Task
Find all integers between m and n (m and n integers with 1 <= m <= n) such that the sum of their squared divisors is itself a square.

****
1,2,3,4,5,6,..250
divisors of each number in the range ex: 1 --> all divisors of 1, 42 ---> all divisors of 42 
****

We will return an array of subarrays or of tuples (in C an array of Pair) or a string. The subarrays (or tuples or Pairs) will have two elements: first the number the squared divisors of which is a square and then the sum of the squared divisors.

EXAMPLES:
list_squared(1, 250) --> [[1, 1], [42, 2500], [246, 84100]]
list_squared(42, 250) --> [[42, 2500], [246, 84100]]

The form of the examples may change according to the language, see "Sample Tests".

Note
In Fortran - as in any other language - the returned string is not permitted to contain any redundant trailing whitespace: you can use dynamically allocated character strings.


=end 

=begin 
*PROBLEM*
Explicit Rules:
-INPUT: 2 integers (range)
-Find all divisors between the 2 integers
-Square each divisor 
-Find the sum of squares 
-Check if that sum is itself a square.
-OUTPUT: Array [number 

*DS*
Array 

*ALGORITHM*
-Initialize divisors to empty array.
-Initialize squares to empty array.
-Find all divisors between the 2 input integers.
  -Iterate from first input up to second input 
    -Check if current num is divisible by second input 
    -If it is, add it to divisors array
-Iterate through divisors array 
  -Square each num add it to squares
-Iterate through the squares 
  -If the current square has a square root 


=end 

# test cases 

def perfect_square(num)
  sqrt = Integer.sqrt(num)
  sqrt * sqrt == num 
end

def list_squared(int1, int2)
  new_arr = []
  (int1..int2).each do |n|
    
  divisors = []
  squares = []
  

  (1..n).each do |num|
    divisors << num if n % num == 0 
  end 
  divisors.each do |divisor|
    squares << divisor ** 2 
  end 
  
  new_arr << [n, squares.sum] if perfect_square(squares.sum)
  
  end 
 new_arr
end 
#p list_squared(3, 10)
p list_squared(1, 250) #== [[1, 1], [42, 2500], [246, 84100]]
 p list_squared(42, 250) #== [[42, 2500], [246, 84100]]
 p list_squared(250, 500) == [[287, 84100]]

=begin 
find divisors int he range--> numbers that don't have a remainder when your divide original number by them
square the divisors ->> sum of squares 
take square root of the sum 

=end 

# def perfect_square(num)
#   sqrt = Integer.sqrt(num)
#   sqrt * sqrt == num 
# end

# p perfect_square(9)
# p perfect_square(10)