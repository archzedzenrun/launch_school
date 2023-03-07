=begin
1)  Add a class method to your MyCar class that calculates the gas mileage of any car.

2)  Override the to_s method to create a user friendly print out of your object.
=end

class MyCar
  attr_accessor :color
  attr_reader :year, :color, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
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

  def self.gas_mileage(distance, gallons_used)
    mileage = distance / gallons_used
    puts "Your gas mileage is #{mileage} miles per gallon."
  end

  def to_s
    "Your vehicle is a #{color} #{year} #{model}" # Why don't I need to use self here?
  end
end

car = MyCar.new("1998", "red", "civic")
puts car

#=============================================================================

class Person

  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
p bob.name
bob.name = "Bob"
p bob.name
=begin
test.rb:9:in `<main>': undefined method `name=' for
  #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

3)  Why do we get this error and how do we fix it?

We are trying to set the name of the object that bob points to as "Bob"
but the instance variable `name` can only be read because attr_reader is a
getter only method. Change to attr_accessor (getter and setter).
=end
