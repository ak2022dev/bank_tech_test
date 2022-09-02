# File: transaction_withdrawal_command.rb

require 'transaction_command'

class TransactionWithdrawalCommand < TransactionCommand
  def initialize( *args )
    @withdrawal = args[0]
    raise ArgumentError.new( "Withdrawal needs to be greater than zero." ) if @withdrawal <= 0
  end

  def transact( balance_in )
    # Will return the new balance
    # after the withdrawal is made
    return balance_in - @withdrawal
  end  
end
