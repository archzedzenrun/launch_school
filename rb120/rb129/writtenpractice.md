<strong>What is OOP? List the benefits of OOP</strong>

Object Oriented Programming is a programming model that makes code easier to
read and maintain by reducing dependencies. This is accomplished by separating
and organizing similar pieces of code into smaller containers called classes.

<strong>What is encapsulation? How is this achieved in Ruby?</strong>

Encapsulation is a form of data protection that hides certain functionalities
from the rest of the program. This ensures that changes made to the code are
done with obvious intention. This is accomplished through the creation of objects
and methods that expose information when interacting with those objects.
```ruby
# Example

class Animal
  attr_reader :type

  def initialize(type)
    @type = type
  end
end

Animal.new('Dog').type

# A new `Animal` object is created and the `type` method is exposing information,
# in this case the value of the `type` instance variable.
```
<strong>What is polymorphism? What are the different ways to apply it?</strong>

Polymorphism allows different data types that share similiar behaviors to respond
to a common interface (methods). One way this is achieved is through class
inheritance, which is grouping similar behaviors together in a superclass and
making them accessible to subclasses. Methods inherited from a superclass can
be overridden in subclasses to provide unique functionality. Inheritance helps
reduce repetitive code throughout the program. Another way is through modules
which are containers that are used to group similar behaviors. Modules are
"mixed in" to classes and there is no limit to the amount of modules that can
be included. Class inheritance is preferred for "is-a" relationships and modules
are preferred for "has-a" relationships. Duck typing is another form of polymorphism
that describes how different object types (of different classes) respond to
methods with the same names.
```ruby
Example of class inheritance:

class Animal
  def eat
  end
end

class Dog < Animal
end

# The dog class will inherit behaviors that are common among all animals, such
# as the ability to eat.
```
```ruby
# Example of mixing in modules:

module Swimmable
  def swim
  end
end

class Animal
end

class Bird < Animal
end

class Shark < Animal
  include Swimmable
end

class Whale < Animal
  include Swimmable
end

# Some of the subclasses inheriting from Animal have the ability to swim, but
# not all of them, the Swimmable module is mixed into these classes.
```
```ruby
# Example of duck typing:

class Dog
  def speak
    'Bark'
  end
end

class Person
  def speak
    'Hello'
  end
end

# Objects of the Dog and Person class both respond to the speak method.
```
<strong>What is a class? What is an object? What is a module?</strong>

A class is like a mold that determines the state and behaviors of objects that
are molded from it. Multiple objects can be created from the same class, all
with unique properties, or "attributes". These attributes make up the "State"
of an object and are tracked via instance variables. Modules are containers
used to group similiar behaviors, they can also be used for namespacing which
is the grouping of similar classes.

<strong>What is instantiation? Provide an example.</strong>

Instantiation is the creation of a new object. This is done by invoking the
`new` method on a class. When an object is instantiated, the constructor method
of the class is automatically invoked.
```ruby
# Example:

class Person
end

Person.new
```
<strong>What is the method lookup path? How is it important?</strong>

When invoking a method, Ruby will look for that method name in a path
based on the inheritance chain and stop when/if it is found. Its important
to make sure our methods are defined in the correct place.

<strong>What is super used for? Provide an example.</strong>

The keyword `super` is used within a method to invoke a method of the same name
higher up in the method lookup path. If `super` is used and not passed any
arguments, Ruby will automatically pass all arguments that were passed into
the method where `super` is being invoked. Use `super()` to pass no arguments.
```ruby
# Example 1:

class Animal
  def initialize(name)
    @name = name
  end
end

class Dog < Animal
  def initialize(name, color)
    super(name)
    @color = color
  end
end

# When the initialize method is invoked in the Dog class, the name argument
# is passed to the initialize method in the Animal superclass. The second
# argument color is assigned to the instance variable color.
```
<strong>What is a constructor? Provide an example</strong>

A constructor is a method that is automatically invoked when a new object is
instantiated.
```ruby
# Example:

class Person
  def initialize(name)
    @name = name
  end
end

# The constructor method is definited as initialize. In this case it takes one
argument and sets that argument to the @name instance variable.
```
<strong>What is an instance variable? Provide an example.</strong>

An instance variable is an attribute that makes up the state of an object.
They are scoped to the object level meaning their values are unique to each
object.
```ruby
# Example:

class Person
  def initialize(name)
    @name = name
  end
end

# @name is an instance variable
```
<strong>What is an instance method? Provide an example.</strong>

An instance method is a behavior that all instances of the class have access to.
```ruby
# Example:

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

# name is an instance method available to all instances of the class, it returns
# the value of the instance variable @name.
```
<strong>What are getter and setter methods? Provide an example.</strong>

Getter methods retrieve the value of an instance variable and setter methods
assign value to an instance variable.
```ruby
# Example:

class Person
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end
end

# The name method is a getter method, it returns the value of the instance
# variable @name. The name= method is a setter method, it sets the intsance
# variable @name to the value of the argument passed into the method.
```
<strong>What are accessor methods? Provide an example.</strong>
Accessor methods are a way of creating getter and setter methods for an instance
variable automatically so that we dont have to manually create them. attr_reader
creates getter methods, attr_writer creates setter methods, and attr_accessor
creates both.
```ruby
# Using the previous example, attr_reader :name replaces the name getter method.
# attr_writer :name replaces the name= setter method. And attr_accessor :name
# replaces both the getter and setter methods for @name.
```
<strong>What are class methods? Provide an example.</strong>

Class methods are methods defined in a class that have their name prepended with
self. These methods are invoked on the class itself and may be used to provide
some kind of functionality not related to any particular instance of that class.
Unlike instance variables, class variables are accessible by class methods.
```ruby
# Example:

class Car
  @@wheels = 4

  def self.wheel_count
    @@wheels
  end
end

Car.wheel_count

# The class method wheel_count is invoked on the Car class. In this case the
# wheel_count method returns the value of the class variable @@wheels which is 4.
```
<strong>What are constant variables? Provide an example.</strong>

Constants are used to store information that will never change. Constants are
lexically scoped, meaning they are available for use within the structure that
they are defined. When a constant is referenced, Ruby will first search the
lexical scope of the reference. If the constant is not found, the next place
Ruby looks is up through the inheritance chain of the structure of the reference.
If the constant is still not found, Ruby will then look in the top level scope.
Constants defined in classes and modules can be directly referenced from outside
the structure by using `::`, the namespace resolution operator.
```ruby
# Example 1:

class Vehicle
  WHEELS = 4
end

# Example 2:

class Vehicle
  WHEELS = 4

  def get_wheels
    WHEELS
  end
end

# Example 3:

class Vehicle
  def get_wheels
    WHEELS
  end
end

class Car < Vehicle
  WHEELS = 4
end

# Example 4:

WHEELS = 4

class Vehicle
  def get_wheels
    WHEELS
  end
end

# In example 1 the WHEELS constant is defined in the Vehicle class which is the
# structure that it is lexically scoped to.

# In example 2 the get_wheels method is also lexically scoped to the Vehicle
# class, making the WHEELS constant accessible from within the get_wheels method.

# Example 3 will result in an undefined constant error. This demonstrates how
# after searching for a constant lexically, Ruby will only then look UP the
# inheritance chain, not down into subclasses.

# Example 4 demonstrates how the WHEELS constant is not found lexically or in
# the inheritance chain of the structure where it was referenced, in this case
# the Vehicle class. Ruby then looks in the top level where it is found.
```
<strong>Whats the difference between instance and class variables?</strong>

Instance variables are scoped to the object level, meaning instance variable
values are unique to each instance of the class. Class variables are scoped
to the class level, meaning their value is shared across all instances of the
class.

<strong>Whats the difference between instance and class methods?</strong>

Instance methods are invoked on instances of the class. Class methods are
invoked on the class itself.

<strong>Why do custom classes usually define a to_s method?</strong>

When using the `puts` method or string interpolation, the `to_s` method is
automatically invoked. Defining the `to_s` method in a custom class lets you
decide which information will be output by overwriting its functionality.

<strong>What is class inheritance? Provide an example.</strong>

Class inheritance is when a class inherits the behaviors defined in another
class. The class inheriting those behaviors is called the subclass and the
class being inherited from is called the superclass.
```ruby
# Example:

class Animal
  def eat
  end
end

class Dog < Animal
end

# The Dog class inherits the behaviors (eat) defined in the Animal class.
```
<strong>What is method overriding? Provide an example.</strong>

Method overriding is when an inherited method from a superclass is
defined in a subclass using the same name. This may be used to provide more
unique functionality.
```ruby
# Example:

class Animal
  def swim
    "I swim."
  end
end

class Fish < Animal
  def swim
    "I swim underwater!"
  end
end

class Dog < Animal
end

puts Fish.new.swim
puts Dog.new.swim

# Dog responds to swim in the way its defined in the Animal superclass while
# swim was overridden in the Fish class to provide more unique functionality.
```
<strong>When are Modules used? What is interface inheritance?
What is multiple inheritance?</strong>

Modules act as a container to group similar behaviors together, which can then
be mixed into different classes. They are also used for namespacing which is
grouping similar classes together. Modules are also used as a container to store
methods that seem out of place in the rest of the code.

Interface inheritance means inheriting behaviors through the interface of a
module instead of class inheritance.

Multiple inhertiance refers to inheriting from multiple classes. Ruby is a
single inheritance language meaning classes can only inherit from one superclass.
Interface inheritance is Rubys version of multiple inheritance.

<strong>What is namespacing? When is using namespacing beneficial?</strong>

Namespacing means grouping similiar classes together in a module. It is beneficial
because it makes it easier to identify similar classes and reduces class name
conflicts in larger programs.

<strong>What is method access control?</strong>

Method access control is used to determine the accessibility of methods. This
is achieved through the use of access modifiers.

<strong>How are encapsulation and method access control related?</strong>

Encapsulation is a form of data protection that hides certain functionalities
from the rest of the program. This ensures that changes made to the code are
done with obvious intention. Method access control demonstrates the concept of
encapsulation.

<strong>What are the differences between public, private, and protected
methods?</strong>

Public methods are available to any part of the program that knows the class or
object names. Private methods are restricted to only be accessible from within
the calling objects class. Protected methods are the same as private methods in
that they cannot be accessed from outside the class, but differ because they are
accessible by other instances of the same class. Objects have access to the
private/protected methods of its class and any structure (classes/modules)
up its inheritance chain (as long as they are not being invoked from outside the
structure).

<strong>What are collaborator objects? Why are they important in OOP?</strong>

Collaborator objects are objects stored within another object's instance
variables, which make up that object's state. They are important because it
helps to reduce dependencies which improves flexibility and maintainability.

<strong>What are fake operators?</strong>

Fake operators are what may appear to be operators but are actually methods.
(+, -, >, <, == to name a few). This means that these methods can be defined in
custom classes to provide unique behavior.

<strong>Equality</strong>

Equality comparisons made using the `==` method by default are based on if the two
objects are the same object unless the `==` is defined in a different way in the
calling objects class.

`equal?` method checks if two objects are the same object.

`eql?` method checks if two objects are of the same class and have the same value.

`===` method is typically used in case statements for checking if a value
belongs as part of a group. For example checking if a number is included in a
range of numbers.