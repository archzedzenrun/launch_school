class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    #@name.upcase! Removed so calling object doesnt get mutated
    "My name is #{@name.upcase}." # .upcase invoked on @name instead
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

=begin
This code prints:
Fluffy
My name is FLUFFY.
FLUFFY
FLUFFY

Further Exploration:

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name # 42
# puts fluffy # My name is 42.
# puts fluffy.name # 42
# puts name # 43

=begin
When the new instance of pet is instantiated and passed name as an argument,
the value of name gets converted to a string representation of the number 42
which is what is returned when the name method is called on fluffy. The variables
name and fluffy are pointing to two different objects. Even if they werent, integers
are immutable objects. The local variable name is then incremented by 1 to the
integer 43 which is what is output by "puts name".
=end