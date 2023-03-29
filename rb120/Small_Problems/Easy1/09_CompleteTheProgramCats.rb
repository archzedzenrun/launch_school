class Pet
  def initialize(name, age, color)
    @name = name
    @age = age
    @color = color
  end
end

class Cat < Pet
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
    # Dont need a getter method when referencing instance variables directly.
    # A getter method would be needed if @ wasnt used.
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

=begin
Since Cat inherits from Pet, we have omitted the initialize method
in Cat and allowed the initialize method in Pet to accept
a third argument (color). In this case this is acceptable because
all pets have a color, it is not something unique to cats.
The color parameter could also be made optional if for some reason
we didn't want to provide the color.
=end