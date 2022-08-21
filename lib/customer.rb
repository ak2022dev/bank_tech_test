# File: customer.rb

require 'customer_id_strategy'
require 'customer_id_ni_strategy'
require 'name'
require 'date'

class Customer

  attr_reader :id, :name, :dob

  def initialize( first_name, middle_name = "", last_name = "", dob_year, dob_month, dob_day )
    set_id
    set_name( first_name, middle_name, last_name )
    set_dob( dob_year, dob_month, dob_day )
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

end
