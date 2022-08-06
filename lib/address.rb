# File: address.rb

class Address

  attr_reader :address1, :address2, :district, :postcode

  MAX_ADD1_LENGTH = 60
  MAX_ADD2_LENGTH = 60
  MAX_DIST_LENGTH = 40
  MAX_PCODE_LENGTH = 8

  def initialize( add1, add2 = "", district, postcode )
    @address1 = add1 if add1_length_ok?( add1 )
    @address2 = add2 if add2_length_ok?( add2 )
    @district = district if dist_length_ok?( district )
    @postcode = postcode if pcode_length_ok?( postcode )
  end

  def add1_length_ok?( add1 )
    add1.length <= MAX_ADD1_LENGTH
  end

  def add2_length_ok?( add2 )
    add2.length <= MAX_ADD2_LENGTH
  end

  def dist_length_ok?( dist )
    dist.length <= MAX_DIST_LENGTH
  end

  def pcode_length_ok?( pcode )
    pcode.length <= MAX_PCODE_LENGTH
  end

end

