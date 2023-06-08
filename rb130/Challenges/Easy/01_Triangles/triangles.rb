=begin
*PROBLEM*
Explicit Rules:
-Determine whether a triangle is equilateral, isoceles, or scalene.
-equilateral as three sides the same length
-isosceles has exactly two sides the same length
-scalene has all sides different lengths
-all sides must have a length greater than 0
-the sum of lengths of any two sides must be greater than the third

Implicit Rules
-Triangle class
  -constructor method takes 3 integer arguments
-kind instance method
  -returns string of the triangle type

*DATA STRUCTURE*

*ALGORITHM*
Triangle constructor method
-Input: 3 integers
-Raise an error if any integer is less than 1 or if the smallest 2 sides are
 not greater than the third.
-Save arguments to be referenced later.

kind instance method
-If all side values are the same, return equilateral
  -Else if exactly two side values are the same, return isosceles
  -Otherwise return scalene
=end

class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3].sort
    raise ArgumentError unless valid_triangle?
  end

  def valid_triangle?
    @sides[0..1].sum > @sides[2]
  end

  def kind
    case @sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    else        'scalene'
    end
  end
end
