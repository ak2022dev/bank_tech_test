# File: transaction_command_spec.rb

require 'transaction_deposit_command'

RSpec.describe TransactionDepositCommand do
  it "Has a transact method" do
    command = TransactionDepositCommand.new
    expect( command ).to respond_to( :transact )
  end
end
