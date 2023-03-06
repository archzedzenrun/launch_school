=begin
Requirements:
-Modify the method from the previous exercise so it ignores non-alphabetic characters
when determining whether it should uppercase or lowercase each letter.
-The non-alphbetic charactesr shoudl still be included in the return value, just not counted
when toggling the desired case.

Algorithm
-Initialize an alphabet variable containing lower and uppercase letters of the alphabet
-Initialize a new string variable to an empty string
-Initialize a toggle variable set to true
-Iterate through the characters of the input string
-If toggle is true, uppercase the current character and add it to the new string
-If toggle is false, lowercase the current character and add it to the new string
-Switch toggle to its opposite value only if the current character is included in the alphabet variable
-Return the new string
=end

def staggered_case(string)
  alphabet = ('a'..'z').to_a + ('A'..'Z').to_a
  new_string = ''
  toggle = true

  string.chars.each do |char|
    if toggle
      new_string << char.upcase
    else
      new_string << char.downcase
    end
    toggle = !toggle if alphabet.include?(char)
  end

  new_string
end

p staggered_case('I Love Launch School!')  == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Revisit

def staggered_case(string)
  toggle = false

  string.downcase.chars.map do |char|
    toggle = !toggle if ('a'..'z').include?(char)
    toggle ? char.upcase : char
  end.join
end
