# File: account_spec.rb

require 'account'

RSpec.describe Account do
  context "It uses composition to record its customer" do
    it "Belongs to a customer" do
      account = Account.new( "First", 2020, 12, 31,
                             "Address1", "", "District", "A9 8BC" )
      expect( account.customer ).not_to be_nil
    end
  end
end
