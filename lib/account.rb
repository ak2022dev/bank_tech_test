# File: account.rb

require "customer"

class Account

  attr_reader :customer
  
  def initialize( first_name, middle_name = "", last_name = "", dob_year, dob_month, dob_day,
    address1, address2, district, postcode )
    @customer = Customer.new( first_name, middle_name, last_name, dob_year, dob_month, dob_day,
    address1, address2, district, postcode )
  end

end
