class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer
tv.model

Television.manufacturer
Television.model

=begin
On line 11 the local variable `tv` is set to a new instance of the `Television`
class. On line 12 the instance method `manufacturer` is invoked on the local
variable `tv` which will result in an undefined method error. This is because
the `manufacturer` method is prepended with self. making it a class method.
Class methods can only be called on the class itself (not an instance of the class).
On line 13 `model` is invoked on tv, in this case `model` is an instance method
and can be called in this way. On line 15 `manufacturer` is invoked on `Television`
class, again this will work because manufacturer is defined as a class method.
Line 16 invokes the instance method `model` on the `Television` class and since
`model` is not a class method, this will result in an undefined method error.
=end