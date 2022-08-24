# File: transaction_command_spec.rb

require 'transaction_command'

RSpec.describe TransactionCommand do
  it "Has a transact method" do
    command = TransactionCommand.new
    expect( command ).to respond_to( :transact )
  end
end
