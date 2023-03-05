=begin
Requirements:
-Write a method that returns the number of friday the 13ths in a year given by an argument.

Algorithm:
-Iterate over a range of dates between the argument year and the argument year plus 1
-On each iteration check if the day of the current date is 13 and if the current date
is a friday.
-Return the count
=end

require 'date'

def friday_13th(year)
  (Date.new(year)...Date.new(year + 1)).count { |date| date.day == 13 && date.friday? }
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
