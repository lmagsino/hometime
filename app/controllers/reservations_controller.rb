class ReservationsController < ApplicationController

  SUCCESS_MESSAGE = 'Successful'
  SUCCESS_STATUS = 200
  FAILED_MESSAGE = 'Error encountered while processing your transaction'
  FAILED_STATUS = 400



  def create
    param_hash =  params.to_unsafe_hash
    @reservation_params = Parsers::Reservation.new(param_hash).call
    @guest_params = Parsers::Guest.new(param_hash).call

    @reservation = ReservationInitializer.call @reservation_params['code']
    @guest = GuestInitializer.call @guest_params['email']
    @reservation.guest = @guest

    @reservation_form = ReservationForm.new @reservation
    @guest_form = GuestForm.new @guest

    process_response
  end



  private

  def process_response
    response = SUCCESS_MESSAGE
    status =  SUCCESS_STATUS

    unless reservation_details_valid &&
      @reservation_form.save &&
      @guest_form.save

      error_messages = get_errors
      status = FAILED_STATUS

      response =
        error_messages.present? ? error_messages : FAILED_MESSAGE
    end

    render :json => {:message => response}, :status => status
  end

  def get_errors
    @reservation_form.errors.full_messages + @guest_form.errors.full_messages
  end

  def reservation_details_valid
    is_reservation_valid = @reservation_form.validate @reservation_params
    is_guest_valid = @guest_form.validate @guest_params

    is_reservation_valid && is_guest_valid
  end

end
