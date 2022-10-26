=begin
Input: Integer
Output: String

Requirements:
Write a method that takes an integer representing minutes.  If the number
of minutes is positive, the time is after midnight.  If the number of minutes is
negative, the time is before midnight.
Return the time of day in 24 hour format "hh,mm"

Algorithm:
=end

def time_of_day(minutes)
  hrs, mins = minutes.divmod(60)
  hrs %= 24
  format("%02i:%02i", hrs, mins)

end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"