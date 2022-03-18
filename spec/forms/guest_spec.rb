require 'rails_helper'

RSpec.describe Guest, :type => :form do

  guest =
    {
      :first_name => 'Test',
      :last_name => 'Test',
      :email => 'test@gmail.com',
      :phone => '9171234567'
    }

  it "is valid with valid attributes" do
    guest_form = GuestForm.new Guest.new
    expect(guest_form.validate(guest)).to eq true
  end

  it "is not valid without a first_name" do
    test_guest = guest.clone
    test_guest[:first_name] = nil

    guest_form = GuestForm.new Guest.new
    expect(guest_form.validate(test_guest)).to eq false
  end

  it "is not valid without a last_name" do
    test_guest = guest.clone
    test_guest[:last_name] = nil

    guest_form = GuestForm.new Guest.new
    expect(guest_form.validate(test_guest)).to eq false
  end

  it "is not valid without a phone" do
    test_guest = guest.clone
    test_guest[:phone] = nil

    guest_form = GuestForm.new Guest.new
    expect(guest_form.validate(test_guest)).to eq false
  end

  it "is not valid without a email" do
    test_guest = guest.clone
    test_guest[:email] = nil

    guest_form = GuestForm.new Guest.new
    expect(guest_form.validate(test_guest)).to eq false
  end

end
