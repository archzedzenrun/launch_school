module Walkable
  def walk
    puts "Lets go for a walk!"
  end
end

class Cat
  include Walkable # Walkable module is "mixed-in", making the walk method available to the instances of the Cat class.

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk
