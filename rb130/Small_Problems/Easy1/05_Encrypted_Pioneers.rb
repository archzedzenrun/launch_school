=begin
*PROBLEM*
Input: String
Output: String

Rules:
-Change each character of the string to the 13th previous alphabetic letter.
-Wrap around to the end of the alphabet if needed

*EXAMPLES*
Nqn Ybirynpr == Ada Lovelace

*DS*
array - alphabet positions/letters

*ALGORITHM*
-Create a alpha array with a-z
-Iterate through chars of input string
  -Find alpha position of current char
  -Subtract 13
  -Replace current letter with letter at new index
-Return new string
=end

def decrypt_rot(str)
  alpha = ('a'..'z').to_a
  str.chars.map do |char|
    if alpha.include?(char.downcase)
      new_char = alpha[alpha.index(char.downcase) - 13]
      char == char.upcase ? new_char.upcase : new_char
    else
      char
    end
  end.join
end

names = ['Nqn Ybirynpr', 'Tenpr Ubccre', 'Nqryr Tbyqfgvar', 'Nyna Ghevat',
  'Puneyrf Onoontr', 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss', 'Ybvf Unvog', 'Pynhqr Funaaba', 'Fgrir Wbof',
  'Ovyy Tngrf', 'Gvz Orearef-Yrr', 'Fgrir Jbmavnx', 'Xbaenq Mhfr',
  'Fve Nagbal Ubner', 'Zneiva Zvafxl', 'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv', 'Tregehqr Oynapu']

names.each { |name| p decrypt_rot(name) }

# def decrypt_rot(string)
#   string.tr('a-zA-Z', 'n-za-mN-ZA-M')
# end