=begin
The @@cats_count variable is a class variable set to 0. Every time a new object of
the Cat class is instantiated, @@cats_count is incremented by 1. This value
can be retrieved by the class method cats_count which returns the value of
the @@cats_count class variable
=end

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Cat.new("white")
Cat.new("black")
Cat.new("orange")
puts Cat.cats_count # Returns 3, the total number of instances of the Cat class.
