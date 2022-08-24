# File: transaction_command_spec.rb

require 'transaction_deposit_command'

RSpec.describe TransactionDepositCommand do
  it "Has a transact method" do
    command = TransactionDepositCommand.new
    expect( command ).to respond_to( :transact )
  end
  it "Returns an increased balance when a deposit is made" do
    command = TransactionDepositCommand.new
    expect( command.transact( 1000, 200 ) ).to eq 1200
  end
  it "Detects when an erroneous zero deposit is attempted" do
    command = TransactionDepositCommand.new
    expect{ command.transact( 1000, 0 ) }.to raise_error( ArgumentError, "Deposit needs to be greater than zero." )
  end
  it "Detects when an invalid negative deposit is attempted" do
    command = TransactionDepositCommand.new
    expect{ command.transact( 1000, -5 ) }.to raise_error( ArgumentError, "Deposit needs to be greater than zero." )
  end
end
