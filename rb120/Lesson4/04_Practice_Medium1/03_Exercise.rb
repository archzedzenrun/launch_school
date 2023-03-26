class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end

  private

  attr_writer :quantity
end

=begin
The problem with adding a setter method and appending self. to `quantity` on
line 10 is it gives direct access to the setter method for the instance variable
`quantity` from outside of the `update_quantity` method which may not be what you want.
This can be fixed by making the setter method for `quantity` private. This makes
it so `update_quantity` still has access to the setter method.
=end