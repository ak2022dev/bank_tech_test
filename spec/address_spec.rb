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
end


