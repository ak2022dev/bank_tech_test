# File: address.rb

class Address

  attr_reader :address1, :address2, :district, :postcode

  def initialize( add1, add2 = "", district, postcode )
    @address1 = add1
    @address2 = add2
    @district = district
    @postcode = postcode  
  end

end

