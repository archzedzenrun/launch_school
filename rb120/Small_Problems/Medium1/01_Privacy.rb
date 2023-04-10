class Machine
  #attr_writer :switch

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def switch_state
    switch
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

=begin
`attr_writer :switch` (switch setter method) and `flip_switch`
method moved to private, making them only accessible from within the `Machine`
class.

Further Exploration:
Changed `attr_writer` to `attr_accessor` to make private getter and setter
methods for `switch`. Defined `switch_state` method that invokes the
private `switch` getter method.
=end