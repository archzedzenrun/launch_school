def zero(number)
  puts number
    if number > 0
      zero(number - 1)
    end 
end 

zero(5)