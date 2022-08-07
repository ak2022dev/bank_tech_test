# File: address.rb

class Address

  attr_reader :address1, :address2, :district, :postcode

  MAX_ADD1_LENGTH = 60
  MAX_ADD2_LENGTH = 60
  MAX_DIST_LENGTH = 40
  MAX_PCODE_LENGTH = 8

  def initialize( add1, add2 = "", district, postcode )
    if Address.check_fields_present?( add1, add2, district, postcode)
      @address1 = add1 if length_ok?( add1, MAX_ADD1_LENGTH )
      @address2 = add2 if length_ok?( add2, MAX_ADD2_LENGTH )
      @district = district if length_ok?( district, MAX_DIST_LENGTH )
      @postcode = postcode if length_ok?( postcode, MAX_PCODE_LENGTH )
    end
  end


  def length_ok?( field, max_len )
    field.length <= max_len
  end

  def self.check_fields_present?( add1, add2, dist, pcode )
    return (add1 != "" && add1 != nil && dist != "" && dist != nil)      
  end

end
