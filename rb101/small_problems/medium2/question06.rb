=begin
Input: 3 integers
Output: Symbol

Requirements:
-Write a method that takes the 3 angles of a triangle as arguments.
-Return a symbol :right, :acute, :obtuse, or :invalid depending on the type of triangle.
-Assume integer valued angles so you dont have to worrry about float errors.
-Assume the arguments are specified in degrees.

-To be a valid triangle, the sum of the angles must be exactly 180 degrees,
and all angles must be greater than 0. If either of these conditions arent met,
the triangle is invalid.

-Right triangle: One angle of the triangle is a right angle (90) degrees.
-Acute triangle: All 3 angles of the triangle are less than 90 degrees.
-Obtuse triangle: One angle is greater than 90 degrees.

Examples:
triangle(60, 70, 50) == :acute   - all angles less than 90
triangle(30, 90, 60) == :right   - one angle is 90
triangle(120, 50, 10) == :obtuse - one angle greater than 90
triangle(0, 90, 90) == :invalid  - one angle is 0
triangle(50, 50, 50) == :invalid - angles dont add up to 180

Data Structure:
-Arguments will be held in an array.

Algorithm:
-Initialize an angles variable set to an array of the arguments.
-Check if the sum of the elements in the angles array is equal to 180.
-Ensure that none of the angle elements are equal to 0.
-Return :invalid if either of these conditinons are not true.

-If all elements of the angles array are less than 90, return :acute
-Else if one element is equal to 90, return :right
-Else if one element is greater than 90, return :obtuse
=end

def triangle(angle1, angle2, angle3)
  angles = [angle1, angle2, angle3]

  return :invalid if angles.sum != 180 || angles.include?(0)

  case
  when angles.all? { |angle| angle < 90 } then :acute
  when angles.any? { |angle| angle > 90 } then :obtuse
  when angles.include?(90)                then :right
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid
