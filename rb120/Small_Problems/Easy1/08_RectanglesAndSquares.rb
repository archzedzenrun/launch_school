class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(size)
    super(size, size) # size is passed as both arguments to the initialize method in the superclass.
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"