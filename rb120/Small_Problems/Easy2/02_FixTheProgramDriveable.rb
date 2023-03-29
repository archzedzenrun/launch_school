module Drivable
  def drive # Methods in mixin modules should not be prepended with self.
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
