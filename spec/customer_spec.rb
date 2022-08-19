# File: customer_spec.rb

require 'customer'

RSpec.describe Customer do
  context "It uses the strategy pattern to provide a unique id" do
    it "has a non-nil id" do
      cust = Customer.new
      expect( cust.id ).not_to be_nil
    end 
  end
end
