# File: customer.rb

require 'customer_id_strategy'
require 'customer_id_ni_strategy'
require 'name'
require 'date'
require 'address'

class Customer

  attr_reader :id, :name, :dob, :address

  def initialize( first_name, middle_name = "", last_name = "", dob_year, dob_month, dob_day,
                  address1, address2, district, postcode )
    set_id
    set_name( first_name, middle_name, last_name )
    set_dob( dob_year, dob_month, dob_day )
    set_address( address1, address2, district, postcode )
  end

  private 

  def set_id
    @id = CustomerIdNIStrategy.new.provide_id
  end

  def set_name( first_name, middle_name, last_name )
    @name = Name.new( first_name, middle_name, last_name )
  end

  def set_dob( dob_year, dob_month, dob_day )
    @dob = Date.new( dob_year, dob_month, dob_day )
  end

  def set_address( address1, address2, district, postcode )
    @address = Address.new( address1, address2, district, postcode )
  end
  
end
