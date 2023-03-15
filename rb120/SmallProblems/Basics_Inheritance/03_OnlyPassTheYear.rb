class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  attr_reader :bed_type

  def initialize(year, bed_type)
    super(year) # Only one argument passed to the initialize method in the superclass
    @bed_type = bed_type # Second argument set as an instance variable of the Truck class
  end
end

class Car < Vehicle # Car still only needs to pass the year as an argument to the Vehicle initialize method
end

truck1 = Truck.new(1994, 'Short')
puts truck1.year
puts truck1.bed_type
car1 = Car.new(1998)
puts car1.year