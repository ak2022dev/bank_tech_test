# File: account_spec.rb

require 'account'

RSpec.describe Account do
  context "It has an account number" do
    it "Remembers its allocated account number" do
        account = Account.new( "00000001", "First", 2020, 12, 31,
                               "Address1", "", "District", "A9 8BC" )
        expect( account.account_number ).to eq "00000001"
    end
  end
  context "It uses composition to record its customer" do
    it "Belongs to a customer" do
      account = Account.new( "00000001", "First", 2020, 12, 31,
                             "Address1", "", "District", "A9 8BC" )
      expect( account.customer ).not_to be_nil
    end
  end
  context "It remembers transactions" do
    it "Starts with an empty transaction list" do
      account = Account.new( "00000001", "First", 2020, 12, 31,
                             "Address1", "", "District", "A9 8BC" )
        expect( account.transactions ).to eq []
    end
  end
end
