# File: customer_id_strategy_spec.rb

require 'customer_id_strategy'

RSpec.describe CustomerIdStrategy do
  it "Has a provide_id method" do
    strat = CustomerIdStrategy.new
    expect( strat ).to respond_to( :provide_id )
  end
end
