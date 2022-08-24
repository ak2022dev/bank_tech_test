# File: transaction_deposit_command.rb

require 'transaction_command'

class TransactionDepositCommand < TransactionCommand
  def transact( balance_in, *args )
    # Will return the new balance
    # after the deposit is made, expecting the deposit
    # amount as args[0]
    return balance_in + args[0]
  end  
end
