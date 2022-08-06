# File: address_spec.rb

require 'address'

RSpec.describe Address do
  context "It initialises with blank values when appropriate" do
    it "has a blank address_2 field by default" do
      address = Address.new("First line", "District", "")
      address2 = address.address2
      expect(address2).to eq ""
    end
  end
  context "It initialises with arguments passed to it" do
    it "remembers the first line of the address" do
      address = Address.new("First line", "District", "")
      add1 = address.address1
      expect(add1).to eq "First line"
    end  
    it "remembers the district of the address" do
      address = Address.new("First line", "District", "")
      dist = address.district
      expect(dist).to eq "District"
    end  
    it "remembers the second line of the address" do
      address = Address.new("First line", "Second line", "District", "")
      add2 = address.address2
      expect(add2).to eq "Second line"
    end  
    it "remembers the postcode of the address" do
      address = Address.new("First line", "Second line", "District", "PC5 9DC")
      add2 = address.postcode
      expect(add2).to eq "PC5 9DC"
    end  
  end
  context "It checks the lengths of arguments passed to it" do
    it "Detects valid length of address1 field" do
      address = Address.new("First line", "Second line", "District", "")
      address1 = address.address1
      is_ok = address.add1_length_ok?( address1 )
      expect( is_ok ).to eq true
    end
    it "Detects invalid length of address1 field" do
      address = Address.new("First line too long.........................................................................................", "Second line", "District", "")
      address1 = address.address1
      expect( address1 ).to eq nil
    end
  end
end


