class Cat
  def self.generic_greeting # class method - self allows the method to be invoked from outside the class, on the class itself
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new
kitty.class.generic_greeting

# Invoking the .class method on kitty returns the class that kitty is an instance
# of, which is `Cat`, generic_meeting is being invoked on that return value (Cat), so it has
# access to the class method generic_greeting. Lines 7 & 9 are doing the same thing.
