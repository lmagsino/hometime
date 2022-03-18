require 'rails_helper'

RSpec.describe Reservation, :type => :form do

  reservation =
      {
        :code => 'YYYY123455',
        :start_date => '2021-04-14',
        :end_date => '2021-04-18',
        :nights => '4',
        :guests => '3',
        :adults => '2',
        :children => '2',
        :infants => '0',
        :status => 'accepted',
        :currency => 'AUD',
        :payout_price => '4200.00',
        :security_price => '500',
        :total_price => '4700.00'
      }

  it "is valid with valid attributes" do
    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(reservation)).to eq true
  end

  it "is not valid without a code" do
    test_reservation = reservation.clone
    test_reservation[:code] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a start date" do
    test_reservation = reservation.clone
    test_reservation[:start_date] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a end date" do
    test_reservation = reservation.clone
    test_reservation[:end_date] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a nights" do
    test_reservation = reservation.clone
    test_reservation[:nights] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a guests" do
    test_reservation = reservation.clone
    test_reservation[:guests] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a adults" do
    test_reservation = reservation.clone
    test_reservation[:adults] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a children" do
    test_reservation = reservation.clone
    test_reservation[:children] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a infants" do
    test_reservation = reservation.clone
    test_reservation[:infants] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a status" do
    test_reservation = reservation.clone
    test_reservation[:status] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a currency" do
    test_reservation = reservation.clone
    test_reservation[:currency] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a payout price" do
    test_reservation = reservation.clone
    test_reservation[:payout_price] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a security price" do
    test_reservation = reservation.clone
    test_reservation[:security_price] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

  it "is not valid without a total price" do
    test_reservation = reservation.clone
    test_reservation[:total_price] = nil

    reservation_form = ReservationForm.new Reservation.new
    expect(reservation_form.validate(test_reservation)).to eq false
  end

end
