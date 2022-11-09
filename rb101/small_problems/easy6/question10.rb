=begin
Input: Positive integer
Output: Right triangle

Requirements:
-Write a method that takes a positive integer (n) as an argument
-Display a right triangle whose sides each have (n) stars
-The hypotenuse of the triangle(the diagonal side) should have one end at the
lower left of the triangle and the other end at the upper right

Examples:

triangle(5)
    *  - 4 space + 1 star
   **  - 3 space + 2 star
  ***  - 2 space + 3 star
 ****  - 1 space + 4 star
*****  - 0 space + 5 star

Algorithm:
-Initialize a spaces variable set to the input integer minus 1
-Initialize a stars variable set to 1
-For as many times as the input integer indicates:
-Output ' ' times spaces plus '*' times stars
-After each output, decrement spaces by 1 and increment stars by 1
=end

def lower_right_triangle(integer)
  spaces = integer - 1
  stars = 1

  integer.times do |_|
    puts (' ' * spaces) + ('*' * stars)

    spaces -= 1
    stars += 1
  end
end

lower_right_triangle(5)

# Further exploration

def upper_right_triangle(integer)
  spaces = 0
  stars = integer

  integer.times do |_|
    puts (' ' * spaces) + ('*' * stars)

    spaces += 1
    stars -= 1
  end
end

upper_right_triangle(5)

def lower_left_triangle(integer)
  spaces = integer - 1
  stars = 1

  integer.times do |_|
    puts ('*' * stars) + (' ' * spaces)

    spaces -= 1
    stars += 1
  end
end

lower_left_triangle(5)

def lower_right_triangle(integer)
  spaces = 0
  stars = integer

  integer.times do |_|
    puts ('*' * stars) + (' ' * spaces)

    spaces += 1
    stars -= 1
  end
end

lower_right_triangle(5)