def check(string)
  if string =~ /lab/ 
    puts string 
  else 
    puts "no match"
  end 
end 

check("labratory")
check("experiment")
check("Pans Labrynth")
check("elaborate")
check("polar bear")
