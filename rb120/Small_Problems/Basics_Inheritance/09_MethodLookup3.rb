module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color

=begin
color method lookup path:
Bird
Flyable
Animal

self class is checked before modules, and included modules are checked before superclass.
=end