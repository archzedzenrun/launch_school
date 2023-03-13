=begin
6)  Let's add a to_s method to the class:

      class Person
        # ... rest of class omitted for brevity

        def to_s
          name
        end
      end

      Now, what does the below output?

      bob = Person.new("Robert Smith")
      puts "The person's name is: #{bob}"

Output is:
The person's name is: Robert Smith

Ruby calls the Person class to_s method on the interpolated variable bob
The to_s method has been overwritten to the name method which outputs the
name of the object it was called on.
=end
