**Object oriented programming** is a programming model that makes large programs more readable and easier to maintain by separating dependencies into smaller data containers so that small changes have less impact on the rest of the program.

<br>

**Classes and objects**



Classes act as a blueprint from which objects are created. They define attributes and behaviors that those objects can interact with.

Objects are created from classes and each object will have unique data associated with it known as "State", which is tracked via instance variables.

<br>

**Encapsulation**

Is the concept of protecting data by hiding certain pieces of code from the rest of the program, which ensures that changes to code are made with obvious intention.

This is accomplished through the creation of objects (which encapsulate state) and methods (which are encapsulated by classes) that expose information when interacting with those objects.

<br>

**Method access control**
Method access control is a form of encapsulation that uses access modifiers to determine method accessibility.

Demonstrates encapsulation because we are using access modifiers to restrict method access from the public interface.

Private methods are only accessible by the calling object from within the class or its subclasses.

Protected methods are only accessible from within the class or its subclasses by the calling object and other instances of the same class.

Public methods are accessible by any part of the program that knows the class or object names. All methods (besides the constructor method) are public by default.

```ruby
class Cat
  def initialize(name, color)
    @name = name
    @color = color
  end

  def get_name
    name
  end

  def get_name(other)
    puts name
    puts other.name
  end

  protected

  attr_reader :age

  private

  attr_reader :name
end

p1 = Person.new('bill', 50)
p2 = Person.new('frank', 60)

# puts p1.name => NoMethod error
puts p1.get_name

# name method is only accessible from within the class through the get_name method by the calling object.

puts p1.get_age(p2)

# all instances of the class have access to protected age method
```

**Polymorphism**

Describes how objects of different types are able to respond to
methods with the same name. Polymorphism can be achieved through
inheritance (class and interface) and duck-typing.

**Class Inheritance** is when classes inherit behaviors from a superclass.
The classes inheriting those behaviors are called subclasses.

```ruby
class Animal
  def speak
    'i dont speak'
  end
end

class Cat < Animal
  def speak
    'meow'
  end
end

class Lizard < Animal
end

class Fish < Animal
end

[Dog.new, Lizard.new, Fish.new].each { |obj| puts obj.speak }

# This demonstrates polymorphism because different object types are able to
# respond to the same methods provided through class inheritance, though
# sometimes in unique ways (method overriding).
```

**Interface Inheritance** is when classes inherit from modules. Modules act as a
container for behaviors which are then "mixed in" to classes using the "include"
method.
```ruby
module Swim
  def swim
    'i can swim'
  end
end

class Animal
  include Swim
end

class Cat < Animal
end

class Lizard < Animal
end

class Fish < Animal
end

class People
  include Swim
end

[Cat.new, People.new].each { |obj| puts obj.swim }

# This demonstrates polymorphism because different object types are able to
# respond to the swim method provided through interface inheritance.

# Animal and People objects have access to swim through interface inheritance,
# while Cat, Lizard, and Fish objects have access to swim through class inheritance.

```
**Duck-typing** describes how different unrelated object types
respond to methods with the same names.
```ruby
class Person
  def speak
    'hello'
  end
end

class Cat
  def speak
    'meow'
  end
end

[Person.new, Cat.new].each { |obj| puts obj.speak }

# Polymorphism is achieved here because unrelated objects can respond to the
# speak method.
```
**Modules**

-Used as a container for grouping similar behaviors that can be mixed into classes.

-Used for namespacing which is grouping similar classes in a module. This can improve readability by making it easier to identify similar classes and can also reduce naming conflicts in larger programs.

-Used to store methods that seem out of place in the rest of the code.

-Used for module methods which are methods whose names are prepended with `self` and are invoked on the module itself.

-Modules don't inherit from anything
<br>

**Getter and Setter methods**

Getter methods retrieve the value of an instance variable and setter methods set the value of an instance variable. Instead of accessing or changing instance variables directly, invoking getter/setter methods can be useful for adding additional functionality
```ruby
class Person
  def initialize
    @name = 'Person'
  end

  def name # getter method for name instance variable
    @name
  end

  def name=(new_name) # setter method for name instance variable
    @name = new_name
  end
end
```

Note: setter methods always return the value of whatever was passed into the method as an argument.

attr* is a built in way of automatically creating getter and setter methods so we don't have to do it manually. attr_reader creates a getter method, attr_writter creates a setter method, and attr_accessor creates both.
```ruby
class Person
  attr_reader :name # automatically creates a getter method for name
  attr_writer :name # automatically creates a setter method for name
  attr_accessor :name # automatically creates both

  def initialize
    @name = 'Person'
  end
end
```
**Class methods**

Class methods are methods that are invoked on the class itself (and cant access instance methods). They are defined by prepending the method name with `self`. Class methods may be used for some kind of functionality that doesnt pertain to the states of instances of that class.
```ruby
class Vehicle
  @@wheels = 4

  def self.wheels
    @@wheels
  end
end

puts Vehicle.wheels # => 4
```
**Class variables**

Class variables are variables that hold class-level information and are scoped to the class level, meaning they share the same value across all instances of the class.

Note: class methods can access initialized class variables.

Note: class variables initialized in subclasses overwrite the values of class variables with the same name that are higher in the inheritance chain.
```ruby
class Vehicle
  @@wheels = 4

  def wheels
    @@wheels
  end
end

puts Vehicle.new.wheels # => 4
puts Vehicle.new.wheels # => 4
```
**Constants**

Constants are used to store information that will never change. Constants are lexically scoped, meaning they are available depending on where they are defined. When a constant is referenced, Ruby will first search the lexical scope of the reference. If the constant is not found, the next place Ruby looks is up the inheritance chain of the structure of the reference. If the constant is still not found, Ruby will then look in the top level scope. When constant references are made using the namespace resolution operator, the top level scope will not be searched.
Note: Constants defined in classes and modules can be directly referenced from outside the structure by using `::`, the namespace resolution operator.
```ruby
TOP_WHEELS = 6

class Vehicle
  WHEELS = 4 # lexical scope is the Vehicle class
end

class Car < Vehicle
  def self.wheels
    WHEELS # searches lexically first (car class)
  end

  def self.top_wheels
    TOP_WHEELS # searches lexically, inheritance chain, then top scope
  end
end

puts Car.wheels # => 4
puts Car.top_wheels # => 6
```
**Method lookup path**

When a method is invoked, Ruby will look for that method name in a path based on the inheritance chain and stop looking when/if it is found, starting with the class of the calling object.

**super** is used to invoke methods higher up in the method lookup path with the same name. If no arguments are explicitly passed along with super, it will pass along the same arguments that were passed into the method where super is being invoked. Invoking super() will pass no arguments.

<br>

**Self**

The definition of self changes with scope.

`self` inside a method references the calling object.

When trying to assign a value to an instance variable from within a method, we need to remember to prepend the variable name with `self` (which invokes the setter method on the calling object for that particular instance variable), otherwise Ruby will think we are trying to initialize a local variable.

`self` in a method name defines a class method.

`self` in a class references the class itself.

`self` within a class method references the calling class.

`self` within a module method references the module itself.
```ruby
class Person
  self # refers to the class

  def name
    self # refers to the calling object
  end

  def self.name # invoked on the class
    self # refers to the calling object (the class)
  end
end

module Person
  def self.speak # refers to the module
    'hello'
  end
end
```
**Fake operators & Equality**

Fake operators refers to methods that may appear to be operators, but are actually methods. This means that their default behavior can be overridden by redefining them in a class.

How objects are compared using the `==` method is determined by how its defined in the class of the calling object. By default, `==` is defined in the `BasicObject` class and checks if two objects are the same object.

`.equal?` method checks if two objects are the same object.

`.eql?` method checks if two objects are objects of the same class and if they also have the same value.

`===` method is typically used in case statements for comparison and it checks if a value is part of a group. example: checking if a number is included in a range.

<br>

**to_s method**

`to_s` is an instance method defined in the `Object` class and is accessible by all objects. The `to_s` method is automatically invoked when the `puts` method is invoked and during string interpolation. It can be redefined in a custom class to provide unique functionality.

**Collaborator objects**

Collaborator objects are objects that are stored within another object's instance variables, making up the state of that object. They are important because they help improve flexibility by separating responsibilites across multiple classes.
```ruby
class Person
  def initialize(name)
    @name = name
  end
end

Person.new('cruz') # String object stored in state of Person object
```


