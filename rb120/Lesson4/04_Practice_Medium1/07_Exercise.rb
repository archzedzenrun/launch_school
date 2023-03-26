class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

=begin
`light_status` changed to just `status` to avoid redundancy when invoking the method
on an instance of the Light class.
=end