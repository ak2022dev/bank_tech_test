# File: address.rb

class Address

  attr_reader :address1, :address2, :district, :postcode

  MAX_ADD1_LENGTH = 60
  MAX_ADD2_LENGTH = 60
  MAX_DIST_LENGTH = 40
  MAX_PCODE_LENGTH = 8

  def initialize( add1, add2 = "", district, postcode )
    check_fields_present( add1, add2, district, postcode )
    assign_stripped_names( add1, add2, district, postcode )
    check_lengths_ok( @address1, @address2, @district, @postcode )
    validate_postcode( @postcode )
  end

  def check_fields_present( add1, add2, dist, pcode )
    if (add1 != "" && add1 != nil && dist != "" && dist != nil) 
      return true
    else
      raise ArgumentError.new( "Address1 and District field required in every address" ) 
    end    
  end


  def assign_stripped_names( add1, add2, district, postcode )
    @address1 = add1.strip
    @address2 = add2.strip
    @district = district.strip
    @postcode = postcode.strip
  end


  def check_lengths_ok( add1, add2, dist, pcode )
    check_length_ok( add1, MAX_ADD1_LENGTH ) && check_length_ok( add2, MAX_ADD2_LENGTH ) && check_length_ok( dist, MAX_DIST_LENGTH ) && check_length_ok( pcode, MAX_PCODE_LENGTH )
  end

  def check_length_ok( field, max_len )    
    if field.length <= max_len
      return true
    else
      raise ArgumentError.new( "Address fields need to be within permitted length." )
    end
  end


  def validate_postcode( pcode )
    # Simple validation for codes as specified on
    # https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/611951/Appendix_C_ILR_2017_to_2018_v1_Published_28April17.pdf 
    return pcode =~ /(^[A-Z][0-9])|(^[A-Z][0-9][0-9])|(^[A-Z][A-Z][0-9])|(^[A-Z][A-Z][0-9][0-9])|(^[A-Z][0-9][A-Z])|([A-Z][A-Z][0-9][A-Z])[ ][0-9][A-Z][A-Z]$/
  end
end
