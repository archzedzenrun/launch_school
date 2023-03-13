# 1)  Create a sub-class from Dog called Bulldog overriding the swim method to return "can't swim!"

class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class Bulldog < Dog # Bulldog is a subclass of its parent/superclass Dog
  def swim # Overrides the inherited swim method from Dog
    "Can't swim!"
  end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"
buddy = Bulldog.new
puts buddy.swim
puts buddy.speak
