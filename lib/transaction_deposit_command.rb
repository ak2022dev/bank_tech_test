# File: transaction_deposit_command.rb

require 'transaction_command'

class TransactionDepositCommand < TransactionCommand
  def transact( balance_in, *args )
    # Will return the new balance
    # after the deposit is made
    return balance_in + args[0] if args[0] > 0
    raise ArgumentError.new( "Deposit needs to be greater than zero." )
  end  
end
