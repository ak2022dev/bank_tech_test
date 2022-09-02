# File: transaction_deposit_command.rb

require 'transaction_command'

class TransactionDepositCommand < TransactionCommand

  def initialize( *args )
    @deposit = args[0]
    raise ArgumentError.new( "Deposit needs to be greater than zero." ) if @deposit <= 0
  end

  def transact( balance_in )
    # Will return the new balance
    # after the deposit is made
    return balance_in + @deposit
  end
  
end
