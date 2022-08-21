# File: customer_spec.rb

require 'customer'

RSpec.describe Customer do
  context "It uses the strategy pattern to provide a unique id" do
    it "has a non-nil id" do
      cust = Customer.new( "First", 2020, 12, 31 )
      expect( cust.id ).not_to be_nil
    end 
  end
  context "It uses a name object to store a valid name" do
    it "remembers the customer's name using a name object" do
      cust = Customer.new( "First", "Middle", "Last", 2020, 12, 31 )
      expect( cust.name.first ).to eq "First"
      expect( cust.name.middle ).to eq "Middle"
      expect( cust.name.last ).to eq "Last"
    end 
  end
  it "Remembers the customer's DOB" do
    cust = Customer.new( "First", 2001, 12, 31 )
    expect( cust.dob.year ).to eq 2001
    expect( cust.dob.month ).to eq 12
    expect( cust.dob.day ).to eq 31
  end
end
