class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(name, height, weight)
    @name = name
    @height = height
    @weight = weight
  end

  def change_info(name, height, weight)
    self.name = name
    self.height = height
    self.weight = weight
  end

  def speak
    "#{name} says Arf!"
  end

  def info
    "#{self.name} is #{self.height} and weighs #{self.weight}"
  end

  def some_method
    self.info
  end
end

sparky = GoodDog.new("Sparky", "2", "40")
p sparky.info

sparky.change_info("fido", "1", "20")
p sparky.some_method

=begin
1)  Create a class called MyCar. When you initialize a new instance or object of
    the class, allow the user to define some instance variables that tell us the
    year, color, and model of the car. Create an instance variable that is set to
    0 during instantiation of the object to track the current speed of the car as
    well. Create instance methods that allow the car to speed up, brake, and shut
    the car off.

2)  Add an accessor method to your MyCar class to change and view the color of
    your car. Then add an accessor method that allows you to view, but not modify,
    the year of your car.

3)  You want to create a nice interface that allows you to accurately describe
    the action you want your program to perform. Create a method called spray_paint
    that can be called on an object and will modify the color of the car.
=end

class MyCar
  attr_accessor :color
  attr_reader :year, :color

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
end

car = MyCar.new("1998", "red", "civic")
# car.speed_up(30)
# car.current_speed
# car.brake(10)
# car.current_speed
# car.shut_off
# car.current_speed
p car.color
p car.spray_paint("black")
p car.color
p car.year
