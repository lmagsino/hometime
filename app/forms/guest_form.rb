class GuestForm < Reform::Form

  properties :first_name, :last_name, :phone, :email

  validates :first_name, :last_name, :phone, :email, :presence => true

  validate :validate_email_uniqueness



  def save
    self.sync
    self.model.save
  end



  private

  def validate_email_uniqueness
    return if self.model.id.present?

    guest = Guest.find_by :email => self.model.email
    errors.add :guest, 'has already been taken' if guest.present?
  end

end
