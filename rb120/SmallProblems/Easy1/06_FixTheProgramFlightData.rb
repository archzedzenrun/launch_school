class Flight
  #attr_accessor :database_handle - removed

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

=begin
Access to database_handle from the user is removed because its likely that
the user should have no need to access it.
=end