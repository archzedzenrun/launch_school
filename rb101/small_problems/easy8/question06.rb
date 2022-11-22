=begin
Input: Two integers
Output: Numbers and strings

Requirements:
-Write a method that takes two arguments, the first is the starting number, second is the ending number.
-Print out all numbers from the starting number to the ending number.
-If a number is divisible by 3 print "Fizz"
-If a number is divisible by 5 print "Buzz"
-If a number is divisible by 3 and 5 print "Fizzbuzz"

Data Structure:
-Strings will be held in an array before joining them into one string

Algorithm:
-Initialize a string variable set to an empty array
-Iterate over the range of numbers starting with the start number and ending with the end number
-If the current number is divisible by 3 and 5
-  add "Fizzbuzz" to the string variable
-Elsif the current number is divisible by 3
-  add "Fizz" to the string variable
-Elsif the current number is divisible by 5
-  add "Buzz" to the string variable
-Else
-  add the current number (converted to a string) to the string variable
-Join and print the string variable with each string separated by ', '
=end

def fizzbuzz(starting_num, ending_num)
  string = []
  (starting_num..ending_num).each do |num|
    case
    when num % 3 == 0 && num % 5 == 0 then string << 'Fizzbuzz'
    when num % 3 == 0 then string << 'Fizz'
    when num % 5 == 0 then string << 'Buzz'
    else string << num.to_s
    end
  end
  puts string.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
