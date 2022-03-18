class ReservationInitializer < ApplicationService

  def initialize code
    @code = code
  end

  def call
    reservation = Reservation.find_by :code => @code
    reservation ||= Reservation.new
  end

end
