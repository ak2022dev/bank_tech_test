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
  it "Can be initialised with an NI number" do
    strat = CustomerIdNIStrategy.new( "RR 78 90 12 B")
    expect( strat.provide_id ).to eq "RR 78 90 12 B"
  end
  it "Rejects NI number not satisfying basic validation" do
    expect{ CustomerIdNIStrategy.new( "34 78 90 12 B") }.to raise_error( ArgumentError, "Incorrect format for NI number")
  end
  it "Rejects NI number not satisfying basic validation" do
    expect{ CustomerIdNIStrategy.new( "QQ AB 90 12 B") }.to raise_error( ArgumentError, "Incorrect format for NI number")
  end
  it "Rejects NI number not satisfying basic validation" do
    expect{ CustomerIdNIStrategy.new( "QQ 12 CD 12 B") }.to raise_error( ArgumentError, "Incorrect format for NI number")
  end
  it "Rejects NI number not satisfying basic validation" do
    expect{ CustomerIdNIStrategy.new( "QQ 12 34 EF B") }.to raise_error( ArgumentError, "Incorrect format for NI number")
  end
  it "Rejects NI number not satisfying basic validation" do
    expect{ CustomerIdNIStrategy.new( "QQ 12 34 56 0") }.to raise_error( ArgumentError, "Incorrect format for NI number")
  end
end
