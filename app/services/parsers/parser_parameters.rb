module Parsers
  class ParserParameters

    RESERVATION = [
      {'code' => ['reservation_code', {'reservation' => 'code'}]},
      {'start_date' => ['start_date', {'reservation' => 'start_date'}]},
      {'end_date' => ['end_date', {'reservation' => 'end_date'}]},
      {'nights' => ['nights', {'reservation' => 'nights'}]},
      {'guests' => ['guests', {'reservation' => 'number_of_guests'}]},
      {'adults' => ['adults', {'reservation' => {'guest_details' => 'number_of_adults'}}]},
      {'children' => ['children', {'reservation' => {'guest_details' => 'number_of_children'}}]},
      {'infants' => ['infants', {'reservation' => {'guest_details' => 'number_of_infants'}}]},
      {'status' => ['status', {'reservation' => 'status_type'}]},
      {'currency' => ['currency', {'reservation' => 'host_currency'}]},
      {'payout_price' => ['payout_price', {'reservation' => 'expected_payout_amount'}]},
      {'security_price' => ['security_price', {'reservation' => 'listing_security_price_accurate'}]},
      {'total_price' => ['total_price', {'reservation' => 'total_paid_amount_accurate'}]},
      {'description' => [{'reservation' => {'guest_details' => 'localized_decription'}}]}
    ]

    GUEST = [
      {'first_name' => [{'guest' => 'first_name'}, {'reservation' => 'guest_first_name'}]},
      {'last_name' => [{'guest' => 'last_name'}, {'reservation' => 'guest_last_name'}]},
      {'phone' => [{'guest' => 'phone'}, {'reservation' => 'guest_phone_numbers'}]},
      {'email' => [{'guest' => 'email'}, {'reservation' => 'guest_email'}]}
    ]



    def initialize module_name
      @module = module_name
    end

    def params
      self.class.const_get @module.to_s.upcase
    end

  end
end
