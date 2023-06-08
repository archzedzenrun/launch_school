=begin
*PROBLEM*
Explicit Rules:
-Convert an octal input string to a decimal.
-Invalid input should return 0.

Implicit Rules:
-
Octal class
  -Constructor method takes 1 argument (string)
to_decimal instance method

*DATA STRUCTURE*
Array - Iteration

*ALGORITHM*
Octal class constructor method
-Input: String
save input as number to be referenced later

to_decimal method
-reverse saved string
-split saved string into array of chars
-iterate through array of chars with indexes
  -convert char to integer
  -multiply current char by 8 and raise it to the power of current index
-return the sum of the array
=end

class Octal
  def initialize(string)
    @string = string
  end

  def to_decimal
    return 0 unless valid_octal?(@string)
    @string.reverse.chars.map.with_index do |char, idx|
      char.to_i * (8**idx)
    end.sum
  end

  def valid_octal?(string)
    string.chars.all? { |char| char.match?(/[0-7]/) }
  end
end
