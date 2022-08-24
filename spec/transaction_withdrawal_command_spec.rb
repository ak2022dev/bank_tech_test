# File: transaction_withdrawal_command_spec.rb

require 'transaction_withdrawal_command'

RSpec.describe TransactionWithdrawalCommand do
  it "Has a transact method" do
    command = TransactionWithdrawalCommand.new
    expect( command ).to respond_to( :transact )
  end
  it "Returns a decreased balance when a withdrawal is made" do
    command = TransactionWithdrawalCommand.new
    expect( command.transact( 1000, 200 ) ).to eq 800
  end
  it "Detects when an erroneous zero withdrawal is attempted" do
    command = TransactionWithdrawalCommand.new
    expect{ command.transact( 1000, 0 ) }.to raise_error( ArgumentError, "Withdrawal needs to be greater than zero." )
  end
  it "Detects when an invalid negative withdrawal is attempted" do
    command = TransactionWithdrawalCommand.new
    expect{ command.transact( 1000, -5 ) }.to raise_error( ArgumentError, "Withdrawal needs to be greater than zero." )
  end
end
