=begin
Input: String
Output: Integer

Requirements:
Write two methods that each take a time of day in 24 hour format
Return the number of minutes before and after midnight
Both methods should return a value in the range 0..1439
Dont use Date and Time methods

Algorithm:
Split the time into hours and minutes and convert the strings to integers
Return 0 if the input is 00:00 or 24:00
Multiply the hours by 60 and add that to the minutes to get the total minutes
Minus the total minutes from 1440 (total minutes in a day)
Return the result

Same process for second method but the result being returned will be
the hours (in minutes) plus the minutes.
=end

# def before_midnight(input_time)
#   time = input_time.split(':')
#   hours = time[0].to_i * 60
#   minutes = time[1].to_i
#   if input_time == '24:00' || input_time == '00:00'
#     return 0
#   else
#     (1440 - hours) - minutes
#   end
# end

# def after_midnight(input_time)
#   time = input_time.split(':')
#   hours = time[0].to_i * 60
#   minutes = time[1].to_i
#   if input_time == '24:00' || input_time == '00:00'
#     return 0
#   else
#     hours + minutes
#   end
# end

# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

# Refactored

def before_midnight(input_time)
  time = input_time.split(':').map(&:to_i)
  return 0 if (time[0] * 60) % 1440 == 0
  1440 - ((time[0] * 60) + time[1])
end

def after_midnight(input_time)
  time = input_time.split(':').map(&:to_i)
  return 0 if (time[0] * 60) % 1440 == 0
  (time[0] * 60) + (time[1])

end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0