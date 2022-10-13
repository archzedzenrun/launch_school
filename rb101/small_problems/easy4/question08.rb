# input: String of digits
# output: Integer

# requirements:

# data structure:

# algorithm
# IF the string starts with '-'
# Remove it and pass the string to the string_to_integer method
# Add '-' to the return value.

# IF the string starts with '+'
# Remove it and pass the string to the string_to_integer method

# IF the string started as a positive number
# Pass it to the string_to_integer method

def string_to_integer(input_string)
  hash = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
           '7' => 7, '8' => 8, '9' => 9 }
  digits = input_string.chars.map { |char| hash[char] }
  integer = 0
  digits.each do |digit|
    integer = integer * 10 + digit
  end
  integer
end

def string_to_signed_integer(string)
  result = string_to_integer(string.delete('-+'))
  string[0] == '-' ? -result : result
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100