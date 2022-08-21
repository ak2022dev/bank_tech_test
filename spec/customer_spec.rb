# File: customer_spec.rb

require 'customer'

RSpec.describe Customer do
  context "It uses the strategy pattern to provide a unique id" do
    it "has a non-nil id" do
      cust = Customer.new( "First" )
      expect( cust.id ).not_to be_nil
    end 
  end
  context "It uses a name object to store a valid name" do
    it "remembers the customer's name using a name object" do
      cust = Customer.new( "First", "Middle", "Last" )
      expect( cust.name.first ).to eq "First"
      expect( cust.name.middle ).to eq "Middle"
      expect( cust.name.last ).to eq "Last"
    end 
  end
end
