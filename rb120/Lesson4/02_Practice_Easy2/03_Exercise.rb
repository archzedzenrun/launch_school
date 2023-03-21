=begin
You find where Ruby will look for a method by looking at the method
lookup path. This is done by invoking the .ancestors method on the class
of an object.

Method lookup path for Orange:
Orange
Taste
Object
Kernel
BasicObject

Method lookup path for HotSauce:
HotSauce
Taste
Object
Kernel
BasicObject
=end

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts Orange.ancestors
puts HotSauce.ancestors
