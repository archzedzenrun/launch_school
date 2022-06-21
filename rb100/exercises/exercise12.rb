hash = { "Joe Smith" => {:email=>"joe@email.com", 
                         :address=>"123 Main st.", 
                         :phone_number=>"555-123-4567"}, 
     "Sally Johnson" => {:email=>"sally@email.com", 
                         :address=>"404 Not Found Dr.", 
                         :phone_number=>"123-234-3454"} }
                     
p "Joe's email is #{hash["Joe Smith"][:email]}"
p "Sally's phone number is #{hash["Sally Johnson"][:phone_number]}"