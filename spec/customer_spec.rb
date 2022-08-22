# File: customer_spec.rb

require 'customer'

RSpec.describe Customer do
  context "It uses the strategy pattern to provide a unique id" do
    it "Has a non-nil id" do
      cust = Customer.new( "First", 2020, 12, 31,
                           "Address1", "", "District", "A9 8BC" )
      expect( cust.id ).not_to be_nil
    end 
  end
  context "It uses a name object to store a valid name" do
    it "Remembers the customer's name using a Name object" do
      cust = Customer.new( "First", "Middle", "Last", 2020, 12, 31,
                           "Address1", "", "District", "A9 8BC" )
      expect( cust.name.first ).to eq "First"
      expect( cust.name.middle ).to eq "Middle"
      expect( cust.name.last ).to eq "Last"
    end 
  end
  it "Remembers the customer's DOB" do
    cust = Customer.new( "First", 2001, 12, 31,
                         "Address1", "", "District", "A9 8BC" )
    expect( cust.dob.year ).to eq 2001
    expect( cust.dob.month ).to eq 12
    expect( cust.dob.day ).to eq 31
  end
  it "Uses an Address object to store a valid address" do
    cust = Customer.new( "First", 2002, 12, 31,
                         "Address1", "", "District", "A9 8BC" )
    expect( cust.address.address1 ).to eq "Address1"
    expect( cust.address.address2 ).to eq ""
    expect( cust.address.district ).to eq "District"
    expect( cust.address.postcode ).to eq "A9 8BC"
  end
end
