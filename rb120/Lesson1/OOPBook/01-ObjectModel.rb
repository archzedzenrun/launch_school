# 1) How do we create an object in Ruby? Give an example of the creation of an object.

class Test
end

new_obj = Test.new

# 2) What is a module? What is its purpose? How do we use them with our classes?
#    Create a module for the class you created in exercise 1 and include it properly.

# A module is a set of reusable behaviors that can be used or "mixed in" by different
# classes. The module must be "included" in the class to inherit its behaviors.

module Speak
  def say(words)
    puts words
  end
end

class Person
  include Speak
end

new_obj = Person.new
new_obj.say("hello world")

# The Test class is inheriting the `say` method from the Speak module.
# `say` is invoked on the new_obj variable which points to the new Test class object.
# `say` is passed the string argument "hello world" which is output by the `puts` method.