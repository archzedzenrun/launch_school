=begin
*PROBLEM*
Explicit Rules:
-Find all possible consecutive number series of a given length in a string.
-If the given series is longer than the given string, throw an error.

Implicit Rules:
-Series class
  -Constructor method takes 1 argument (string)
-slices instance method
  -takes an integer argument

*EXAMPLES*
"91274", 4
9127, 1274

*DATA STRUCTURE*
-Array to hold consecutive series

*ALGORITHM*
Series constructor method
-Input: String
-Save input to a variable that can be referenced later

slices instance method
-Input: Integer
-Raise an argument error if input is larger than the size of saved string
-Return an array of all possible consecutive number series
=end

class Series
  def initialize(string)
    @num_arr = string.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError if length > @num_arr.size
    @num_arr.each_index.with_object([]) do |idx, results|
      slice = @num_arr[idx, length]
      return results if length > slice.size
      results << slice
    end
  end
end
