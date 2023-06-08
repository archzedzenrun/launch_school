=begin
*PROBLEM*
Input: String
Output: Integer

Explicit Rules:
-Count the number of differences between two strings
-If strings are unequal length, count the number of differences up to the
 size of the smaller string.

Implicit Rules:
-DNA class, takes a string argument on instantiation
-hamming_distance instance method, takes a string argument

*DATA STRUCTURE*
-Array (iteration)

*ALGORITHM*
DNA class constructor method
-Initialize instance variable strand1 to the input string

hamming_distance method
-Initialize a distance var to 0
-Iterate through the chars and indexes of instance variable strand1
  -Stop iterating if input string at current index is nil
  -Compare current char with char at current index in input string
  -If they are different, increment distance by 1
-Return distance
=end

class DNA
  def initialize(strand1)
    @strand1 = strand1
  end

  def hamming_distance(strand2)
    distance = 0
    @strand1.chars.each_with_index do |char, idx|
      break if strand2[idx].nil?
      distance += 1 if char != strand2[idx]
    end
    distance
  end
end
