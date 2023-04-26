Explain the code / what is it an example of? / what is the output?
```ruby
class Dog
  def initialize(name)
    @name = name
  end

  def say_hello
    puts "Woof! My name is #{@name}."
  end
end
```
On lines 2-10 the `Dog` class is defined. On line 3 the `initialize` constructor
method is defined with one parameter `name`. On instantation of a new `Dog`
object, the argument passed in will be set to the instance variable `@name`.
On line 7 the `say_hello` method is defined. On line 8 the `@name` instance
variable is interpolated into the string "Woof! My name is #{@name}". `@name`
will be whatever was passed into the constructor method on the instantiation
of a new object.
```ruby
class GoodDog
end

sparky = GoodDog.new
```
The code defines a GoodDog class and initializes a local variable
named sparky to a new GoodDog object. This is an example of object
instantiation. It doesnt output anything.
```ruby
module Speak
  def speak(sound)
    puts sound
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")   # => ?
bob = HumanBeing.new
bob.speak("Hello!")   # => ?
```
The `Speak` module is defined on lines 1-5. It contains 1 method
named `speak` that outputs the argument passed to it.

The `Speak` module is mixed in to the `GoodDog` and `HumanBeing`
classes, giving them access to the `speak` method.

On line 16 the `speak` method is invoked on local variable `sparky`
which points to a `GoodDog` object, and is passed the argument
"Arf!" which is what will be output.

On line 18 the `speak` method is invoked on local variable `bob` which
points to a `HumanBeing` object, and is passed the argument 'Hello!'
which is what will be output.

This is an example of interface inheritance, using modules to mix in
behaviors to different classes.
```ruby
module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

puts GoodDog.ancestors   # => ?
puts HumanBeing.ancestors   # => ?
```
On line 15 the `ancestors` method is invoked on the `GoodDog` class
which will output the following (on new lines):
GoodDog, Speak, Object, Kernel, BasicObject

On line 16 the `ancestors` method is invoked on the `HumanBeing`
class which will output the following (on new lines):
HumanBeing, Speak, Object, Kernel, BasicObject

This is an example of using the ancestors method to view the
inheritance chain of a class.
```ruby
# 2:50

class GoodDog
  def initialize
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new   # => ?
```
On line 7 a `GoodDog` object is instantiated and assigned to local
variable `sparky`. The constructor method `initialize` in the `GoodDog` class
is automatically invoked and outputs the string "This object was
initialized!"

This is an example of how constructor methods are automatically
invoked when creating objects.
```ruby
# 5:33
class GoodDog
  def initialize(name)
    @name = name
  end
end

sparky = GoodDog.new("Sparky")
p sparky
```
On line 7 the local variable `sparky` is initialized to a new
`GoodDog` object. This object passes the string "Sparky" as an
argument to the `initialize` method where it is assigned to
the instance variable `@name`.

On line 8 the `p` method is invoked and passed `sparky` as an
argument. This will output the `GoodDog` object which contains
an encoding of its place in memory and its attributes and their
values, in this case `@name = Sparky`

This is an example of instance variables and how they make up
the state of an object.
```ruby
# 4:05
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "Arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak   # => ?
fido = GoodDog.new("Fido")
puts fido.speak   # => ?
```
On line 11 and 13 local variables `sparky` and `fido` are initialized
to `GoodDog` objects and passed the strings "Sparky" and "Fido", respectively.
On line 12 and 14 the `speak` method is invoked on `sparky` and
`fido`, which will output the string "Arf!" for both.

This is an example of how instance methods are available to all
instances of a class.
```ruby
# 4:37
class GoodDog
  def initialize(name)
    @name = name
  end

  def speak
    "#{@name} says arf!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.speak   # => ?
fido = GoodDog.new("Fido")
puts fido.speak   # => ?
```
On line 11 and 13 local variables `sparky` and `fido` are initialized
to new `GoodDog` objects that pass the strings "Sparky" and "Fido"
as arguments, respectively. These arguments are set to the `@name`
instance variable within the `initialize` method on instantiation.
On line 12 and 14 the `speak` method is invoked on `sparky` and
`fido` which outputs the strings "Sparky says arf!" and "Fido says
arf!".

This is an example of interpolating an instance variable into a
string and how the value of instance variables are unique to each
instance of a class.
```ruby
# 2:59
class GoodDog
  # ... rest of code omitted for brevity

  def what_is_self
    self
  end

  def self.this_is_a_class_method
  end

  puts self
end
```
`self` on line 5 refers to the calling object of the `what_is_self` method.
`self` on line 8 defines a class method.
`self` on line 11 refers to the class itself.
```ruby
# 6:13
class Animal
  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  protected

  def a_protected_method
    "IDK, I'm protected!"
  end
end

fido = Animal.new
fido.a_public_method # =>
```
On line 13 the local variable `fido` is set to a new instance of the `Animal`
class. On line 14 `a_public_method` is invoked on `fido`. On line 3
"Will this work? " is concatenated with the return value of invoking
`a_protected_method` on `self` which refers to the calling object `fido`
The output will be "Will this work? IDK, I'm protected!" because protected
methods can be invoked from within the class, in this case from within the
`a_public_method` instance method.