statement = "The Flintstones Rock"

statement_arr = statement.chars

statement_hash = statement_arr.each_with_object({}) do |char, hash|
  hash[char] = statement_arr.count(char)
end 

p statement_hash