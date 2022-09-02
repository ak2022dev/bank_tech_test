# File: account.rb

require "customer"

class Account

  attr_reader :customer, :account_number, :transactions
  
  def initialize( acc_num, first_name, middle_name = "", last_name = "", dob_year, dob_month, dob_day,
    address1, address2, district, postcode )
    @account_number = acc_num   # This is actually a string
    @customer = Customer.new( first_name, middle_name, last_name, dob_year, dob_month, dob_day,
    address1, address2, district, postcode )
    @transactions = []
  end

  def transact( transaction )
    transactions.push( transaction )
  end
end
