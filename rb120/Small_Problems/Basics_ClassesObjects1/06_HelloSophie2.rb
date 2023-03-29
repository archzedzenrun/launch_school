class Cat
  def initialize(name)
    @name = name
  end

  def greet # Instance method, can only be called by instances of the class
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
