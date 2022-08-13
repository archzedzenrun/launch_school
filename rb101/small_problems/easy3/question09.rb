def real_palindrome?(string)
  new_string = ''
  string.downcase.each_char do |char|
    if (0..9).include?(char) || ('a'..'z').include?(char)
      new_string << char
    end
  end
  new_string == new_string.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false