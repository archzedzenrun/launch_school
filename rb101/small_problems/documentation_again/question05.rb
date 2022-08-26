a = %w(a b c d e)
puts a.fetch(7)                      # => IndexError index 7 outside of array bounds
puts a.fetch(7, 'beats me')          # => 'beats me'
puts a.fetch(7) { |index| index**2 } # => 49

# Line 2 - An exception will be raised if the given index is out of range.
# Line 3 - The value of the default argument will be displayed since the index is out of range.
# Line 4 - Index is out of range, so the block is executed on the index value.