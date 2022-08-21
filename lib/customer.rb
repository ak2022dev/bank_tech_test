# File: customer.rb

require 'customer_id_strategy'
require 'customer_id_ni_strategy'

class Customer

  attr_reader :id

  def initialize
    # @id = ""
    @id = CustomerIdNIStrategy.new.provide_id
  end

end
