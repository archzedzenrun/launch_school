=begin
Input: 3 Integers
Output: String

Requirements:
-Write a method that determines the average of the three scores passed to it.
-Return the letter value associated with that grade.
-Tested values are all between 0 and 100.
-No need to check fo rnegative values or values greater than 100.

Algorithm:
-Add the 3 inputs together and divide the result by 3
-Determine the letter grade based on that result
-90 to 100 is an 'A'
-80 to 90 is a 'B'
-70 to 80 is a 'C'
-60 to 70 is a 'D'
-0 to 60 is an 'F'
=end

def get_grade(g1, g2, g3)
  average = (g1 + g2 + g3) / 3
  case average
  when (100..)   then 'A+'
  when (90..100) then 'A'
  when (80..90)  then 'B'
  when (70..80)  then 'C'
  when (60..70)  then 'D'
  when (0..60)   then 'F'
  end
end


p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(45, 55, 39) == "F"
p get_grade(95, 100, 107) == 'A+' # Further exploration
