=begin
1)  Create a superclass called Vehicle for your MyCar class to inherit from
    and move the behavior that isn't specific to the MyCar class to the superclass.
    Create a constant in your MyCar class that stores information about the vehicle
    that makes it different from other types of Vehicles.

    Then create a new class called MyTruck that inherits from your superclass that
    also has a constant defined that separates it from the MyCar class in some way.

2)  Add a class variable to your superclass that can keep track of the number
    of objects created that inherit from the superclass. Create a method to print
    out the value of this class variable as well.

3)  Create a module that you can mix in to ONE of your subclasses that describes
    a behavior unique to that subclass.

4)  Print to the screen your method lookup for the classes that you have created.

5)  Move all of the methods from the MyCar class that also pertain to the MyTruck
    class into the Vehicle class. Make sure that all of your previous method calls
    are working when you are finished.

6)  Write a method called age that calls a private method to calculate the age
    of the vehicle. Make sure the private method is not available from outside
    of the class. You'll need to use Ruby's built-in Time class to help.
=end
module Carryable
  def can_carry?(pounds)
    pounds < 2000
  end
end

class Vehicle
  attr_accessor :color
  attr_reader :year, :color, :model

  @@num_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@num_of_vehicles += 1
  end

  def self.vehicle_count # Needs self. because calling the method from outside the class on the class itself makes it otherwise inaccessible?
    puts "#{@@num_of_vehicles} vehicle objects have been created."
  end

  def self.gas_mileage(distance, gallons_used)
    mileage = distance / gallons_used
    puts "Your gas mileage is #{mileage} miles per gallon."
  end

  def current_speed
    puts "Your current speed is #{@speed}"
  end

  def speed_up(num)
    @speed += num
    puts "You speed up to #{@speed}"
  end

  def brake(num)
    @speed -= num
    puts "You slow down to #{@speed}"
  end

  def shut_off
    @speed = 0
    puts "You slow down and park the vehicle"
  end

  def spray_paint(color)
    self.color = color
    puts "Your car is now #{@color}"
  end

  def to_s
    "Your vehicle is a #{color} #{year} #{model}" # Why don't I need to use self here?
  end

  def vehicle_age
    puts "Your vehicle is #{calculate_age} years old."
  end

  private

  def calculate_age
    Time.new.year - self.year.to_i
  end
end

class MyCar < Vehicle
  DOOR_NUM = 4
end

class MyTruck < Vehicle
  DOOR_NUM = 2
  include Carryable
end

# car = MyCar.new("1998", "red", "civic")
# truck = MyTruck.new("1995", "green", "silverado")
# puts MyTruck.ancestors
# puts MyCar.ancestors
# puts Vehicle.ancestors
# truck.vehicle_age
# car.vehicle_age

=begin
7)  Create a class 'Student' with attributes name and grade. Do NOT make the
    grade getter public, so joe.grade will raise an error. Create a better_grade_than?
    method, that you can call like so...
=end

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_name)
    grade > other_name.grade
  end

  protected

  def grade
    @grade
  end
end

joe = Student.new("Joe", 97)
bob = Student.new("Bob", 58)
puts joe.better_grade_than?(bob)
puts joe.grade

=begin
8)  Given the following code...

    bob = Person.new
    bob.hi

    And the corresponding error message...

    NoMethodError: private method `hi' called for #<Person:0x007ff61dbb79f0>
    from (irb):8
    from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

    What is the problem and how would you go about fixing it?

Private methods are only accessible from within the class itself?
Move the hi method so that it is a public method.
Create another public method that can access the private hi method.
=end