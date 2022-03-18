class ReservationForm < Reform::Form

  properties(
    :code, :start_date, :end_date, :nights, :guests, :adults, :children, :infants, :status, :description, :currency, :payout_price, :security_price,
    :total_price
  )

  validates(
    :code, :start_date, :end_date, :nights, :guests, :adults, :children,
    :infants, :status, :currency, :payout_price, :security_price, :total_price,
    :presence => true
  )

  validate :validate_code_uniqueness



  def save
    self.sync
    self.model.save
  end



  private

  def validate_code_uniqueness
    return if self.model.id.present?

    reservation = Reservation.find_by :code => self.model.code
    errors.add :code, 'has already been taken' if reservation.present?
  end

end
