=begin
# PROBLEM
  Input: Integer (year)
  Output: String
  Explicit requirements:
  - Write a method that takes a year as input and returns the century.
  - The return value should be a string that begins with the century number
    and ends with st, nd, rd, or th as appropriate for that number.
  Implicit requirements:
  - New centuries begin in years that end with 01.So, the years 1901-2000
    comprise the 20th century.
  Questions:

# EXAMPLES
  century(2000) == '20th'
  century(2001) == '21st'
  century(1965) == '20th'
  century(256) == '3rd'
  century(5) == '1st'
  century(10103) == '102nd'
  century(1052) == '11th'
  century(1127) == '12th'
  century(11201) == '113th'

# DATA STRUCTURE

# ALGORITHM
  SET a century variable equal to:
  IF the input year is divisible by 100, divide the year by 100
  ELSE divide the year by 100 and add 1
  Convert century to a string

  IF 11 12 or 13 are the last numbers of the string append 'th'
  IF the last number is 1, append 'st'
  IF the last number is 2, append 'nd'
  IF the last number is 3, append 'rd'
  ELSE appent 'th'

  Return the century variable
# CODE
=end

def century(year)
  century = (year % 100 == 0) ? (year / 100) : (year / 100 + 1)
  century = century.to_s

    if ['11', '12', '13'].include?(century[-2, 2])
      century << 'th'
    elsif century[-1] == '1'
      century << 'st'
    elsif century[-1] == '2'
      century << 'nd'
    elsif century[-1] == '3'
      century << 'rd'
    else
      century << 'th'
    end

  century
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'