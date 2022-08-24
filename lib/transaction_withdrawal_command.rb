# File: transaction_withdrawal_command.rb

require 'transaction_command'

class TransactionWithdrawalCommand < TransactionCommand
  def transact( balance_in, *args )
    # Will return the new balance
    # after the withdrawal is made
    return balance_in - args[0] if args[0] > 0
    raise ArgumentError.new( "Withdrawal needs to be greater than zero." )
  end  
end
