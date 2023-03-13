class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty
# puts method is invoking the to_s method on the instance.
# to_s is changed to output the resulting string.
