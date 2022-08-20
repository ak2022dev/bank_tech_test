# File: customer_id_ni_strategy_spec.rb

require 'customer_id_ni_strategy'

RSpec.describe CustomerIdNIStrategy do
  it "Has a provide_id method" do
    strat = CustomerIdNIStrategy.new
    expect( strat ).to respond_to( :provide_id )
  end
  it "Provides a default NI number" do
    strat = CustomerIdNIStrategy.new
    expect( strat.provide_id ).to eq "QQ 12 34 56 A"
  end
end
