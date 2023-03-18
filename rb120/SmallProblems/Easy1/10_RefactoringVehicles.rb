class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels

  end

  def to_s
    "#{make} #{model} has #{wheels} wheels"
  end
end

class Car < Vehicle
  def wheels
    4
  end
end

class Motorcycle < Vehicle
  def wheels
    2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end

  def wheels
    6
  end

  def to_s
    super + " and a payload of #{payload}"
  end
end

car = Car.new("honda", "civic")
motorcycle = Motorcycle.new("harley", "davidson")
truck = Truck.new("chevy", "silverado", "ton")

puts car
puts motorcycle
puts truck

=begin
In this case I don't think it makes sense to defined a wheels method in Vehicle that
overrides the wheels method in the other classes. It might make more sense
to set the number of wheels to an instance variable on instantiation, possibly
with a default value of 0 for vehicles with no wheels.
=end