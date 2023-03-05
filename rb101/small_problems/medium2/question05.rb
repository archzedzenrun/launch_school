=begin
Input: Integers/Floats
Output: Symbol

Requirements:
-Write a method that takes the lengths of the 3 sides of a triangle as arguments.
-Return a symbol :equilateral, :isocles, :scalene, :invalid depending on the type of triangle.
-To be a valid triangle, the sum of the lnegths of the two shortest sides must be greater
than the length of the longest side.
-All sides must have lengths greater than 0.
-If either of these conditions is not satisfied, the triangle is invalid.

-Equilateral: All 3 sides are of equal length
-Isosceles: 2 sides are of equal length, while the 3rd is different
-Scalene: All 3 sides are of different length

Algorithm:
-First we need to determine if the triangle is valid.
-Initialize a sides variable to an array of the 3 arguments.
-Sort the array by numerical value. The first 2 elements will be the shortest sides.
-Find the sum of the first 2 elements and check if it is greater than the value of the 3rd element.
-Also check that all 3 elements are greater than 0.
-If neither of these conditions are met, return the symbol :invalid.

-If the triangle is valid:
-Check if all 3 eleemnts are equal.
-If so, return the symbol :equilateral.
-Else if 2 elements are equal, while the 3rd is different, return the symbol :isosceles.
-Else if the 3 sides are all different, return the symbol :scalene.
=end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort
  if (sides[0] + sides[1]) < sides[2] || sides.include?(0)
    :invalid
  else
    case sides.uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    when 3 then :scalene
    end
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
