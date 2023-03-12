class Cat
  def initialize(name)
    @name = name # Instance variable, unique to each class object (instance)
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
