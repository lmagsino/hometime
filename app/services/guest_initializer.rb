class GuestInitializer < ApplicationService

  def initialize email
    @email = email
  end

  def call
    guest = Guest.find_by :email => @email
    guest ||= Guest.new
  end

end
