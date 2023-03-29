class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end

  def name
    @name
  end

  def name=(name) # Manual setter method, attr_writer :name would work too
    @name = name
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = ('Luna')
kitty.greet
