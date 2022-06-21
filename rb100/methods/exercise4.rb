# Question: What will the following code print to the screen?

def scream(words)
   words = words + "!!!!"
   return
   puts words 
end 

scream("Yippeee")

# Answer: Nothing.  return on line 5 prevents the next line from printing words to the screen