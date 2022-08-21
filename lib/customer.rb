# File: customer.rb

require 'customer_id_strategy'
require 'customer_id_ni_strategy'
require 'name'

class Customer

  attr_reader :id, :name

  def initialize( first_name, middle_name = "", last_name = "" )
    @id = CustomerIdNIStrategy.new.provide_id
    set_name( first_name, middle_name, last_name )
  end

  private 

  def set_name( first_name, middle_name, last_name )
    @name = Name.new( first_name, middle_name, last_name )
  end

end
