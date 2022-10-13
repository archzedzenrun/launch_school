# input: integer
# output: string representation of the input

# requirements: dont use standard conversion methods

# algorithm:
# If the input integer is a positive number, add a + to the beginning of the return value of
# passing the integer to the integer_to_string method.

# If the input integer is a negative number, convert it to a positive number and add a - to the beginning of the return value
# of passing the integer to the integer_to_string method.

# Else return the value of passing the integer to the integer_to_string method.

def integer_to_string(integer)
  hash = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5',
           6 => '6', 7 => '7', 8 => '8', 9 => '9' }

  integer.digits.reverse.map { |num| hash[num] }.join
end

def signed_integer_to_string(integer)
  result = integer_to_string(integer.abs)
  if integer > 0
    result.insert(0, '+')
  elsif integer < 0
    result.insert(0, '-')
  else
    result
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'