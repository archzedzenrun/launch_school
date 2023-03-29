class Cat
  attr_accessor :name # Shorthand for the manual getter and setter methods (accessor does both)

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = ('Luna')
kitty.greet
