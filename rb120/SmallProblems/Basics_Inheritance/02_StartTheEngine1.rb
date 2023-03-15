class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    super # Invokes the initialize method from the Vehicle superclass first
    start_engine # Then the intitialize method from Truck (invokes the start_engine method)
  end
  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year
