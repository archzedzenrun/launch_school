=begin
Input: Float
Output: String

Requirements:
-Write a method that takes a floating point number that represents an angle between 0 and 360 degrees
-Return a string that represents that angle in degrees, minutes, and seconds.
-Use a degree symbol to represent degrees
-Use a single quote to represent minutes
-Use a double quote to represent seconds.
-A degree has 60 minutes, a minute has 60 seconds.

Examples:
dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

First part of the string represents the degrees as an integer

Algorithm:
-Initialize a degree variable and set it to the input number before the decimal
-Inialize a minutes variable and set it to the whole number result of multiplying the number
after the decimal by 60
-Initialize a seconds variable and set it to the result of multiplying the decimal remainder
from the minutes operation by 60
-Return the result in a string
=end

DEGREE = "\xC2\xB0"

def dms(float)
  degrees = float.to_i
  minutes = (float % 1) * 60
  seconds = (minutes % 1) * 60
  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

p dms(30)
p dms(76.73)
p dms(254.6)
p dms(93.034773)
p dms(0)
p dms(360)