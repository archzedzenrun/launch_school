# input: Integer
# output: String representation of input

# requirements:
# dont use to_s method

# data structure: integer -> array -> string

# algorithm:
# Iterate over the digits of the input string and transform them into their string equivalent.
# Join the array into a string


def integer_to_string(integer)
  hash = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
           6 => '6', 7 => '7', 8 => '8', 9 => '9' }

  integer.digits.reverse.map { |num| hash[num] }.join
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'