# File: address.rb

class Address

  attr_reader :address1, :address2, :district, :postcode

  MAX_ADD1_LENGTH = 60

  def initialize( add1, add2 = "", district, postcode )
    @address1 = add1 if add1_length_ok?( add1 )
    @address2 = add2
    @district = district
    @postcode = postcode  
  end

  def add1_length_ok?( add1 )
    add1.length <= MAX_ADD1_LENGTH
  end

end

