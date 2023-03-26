class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

=begin
Currently quantity is being initialized as a local variable.

On line 11 `quantity` needs to be prepended with `self.` or `@`.
A setter method is also needed for the instance variable `@quantity` which can
resolved by manually adding a setter method, or moving it from attr_reader to
an attr_accessor.
=end