=begin
Requirements:
-Write a method that displays a 4 pointed diamond in an n x n grid.
-n is an odd integer that is supplied as an argument to the method.
-Assume the argument will always be an odd integer.

Examples:
diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

Algorithm:
-Initialize a spaces variable and set it to the input number divided by 2
-Initialize a star variable set to '*'
-Initialize a counter variable set to 0
-Until the counter variable is equal to the input number
-Output the space variable
-Output the star variable
=end

def diamond(n)
  star = '*'

  n.times do |index|
    puts star.center(n)

    if index < n / 2 # if index less than halfway point
      star += '**'
    else
      star.chop!; star.chop!
    end
  end
end

diamond(9)
