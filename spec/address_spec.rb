# File: address_spec.rb

require 'address'

RSpec.describe Address do
  context "It initialises with blank values when appropriate" do
    it "has a blank address_2 field by default" do
      address = Address.new("First line", "District", "")
      address2 = address.address2
      expect(address2).to eq ""
    end
  end
  context "It initialises with arguments passed to it" do
    it "remembers the first line of the address" do
      address = Address.new("First line", "District", "")
      add1 = address.address1
      expect(add1).to eq "First line"
    end  
    it "remembers the district of the address" do
      address = Address.new("First line", "District", "")
      dist = address.district
      expect(dist).to eq "District"
    end  
    it "remembers the second line of the address" do
      address = Address.new("First line", "Second line", "District", "")
      add2 = address.address2
      expect(add2).to eq "Second line"
    end  
    it "remembers the postcode of the address" do
      address = Address.new("First line", "Second line", "District", "PC5 9DC")
      add2 = address.postcode
      expect(add2).to eq "PC5 9DC"
    end  
  end
  context "It checks the lengths of arguments passed to it" do
    it "Detects valid length of address1 field" do
      address = Address.new("First line", "Second line", "District", "")
      address1 = address.address1
      is_ok = address.check_length_ok( address1, Address::MAX_ADD1_LENGTH )
      expect( is_ok ).to eq true
    end
    it "Detects invalid length of address1 field" do
      expect { Address.new("First line too long.........................................................................................", 
               "Second line", "District", "") }.to raise_error( ArgumentError, "Address fields need to be within permitted length.")
    end
    it "Detects valid length of address2 field" do
      address = Address.new("First line", "Second line", "District", "")
      address2 = address.address2
      is_ok = address.check_length_ok( address2, Address::MAX_ADD2_LENGTH )
      expect( is_ok ).to eq true
    end
    it "Detects invalid length of address2 field" do
      expect { Address.new("First line", "Second line too long.........................................................................................", 
               "District", "A9 8BC") }.to raise_error( ArgumentError, "Address fields need to be within permitted length.")
    end
    it "Detects valid length of district field" do
      address = Address.new("First line", "Second line", "District", "")
      district = address.district
      is_ok = address.check_length_ok( district, Address::MAX_DIST_LENGTH )
      expect( is_ok ).to eq true
    end
    it "Detects invalid length of district field" do
      expect { Address.new("First line", "Second line", 
                           "District.........................................................................", "") }.to raise_error( ArgumentError, "Address fields need to be within permitted length.")
    end
    it "Detects valid length of postcode field" do
      address = Address.new("First line", "Second line", "District", "AW9 3BV")
      postcode = address.postcode
      is_ok = address.check_length_ok( postcode, Address::MAX_PCODE_LENGTH )
      expect( is_ok ).to eq true
    end
    it "Detects invalid length of postcode field" do
      expect { Address.new("First line", "Second line", "District", "AW96 3DFEDS") }.to raise_error( ArgumentError, "Address fields need to be within permitted length.")
    end
  end
  context "It checks for presence of required fields" do
    it "Checks for presence of required first line and district of address" do
      address = Address.new("First line", "", "District", "")
      add1 = address.address1
      add2 = address.address2
      dist = address.district
      pcode = address.postcode
      expect( address.check_fields_present( add1, add2, dist, pcode ) ).to eq true
    end
    it "Detects absence of required first line and district of address" do
      expect { Address.new("", "", "", "") }.to raise_error( ArgumentError, "Address1 and District field required in every address")
    end
  end
  context "It validates postcodes to check only permitted characters allowed" do
    # Source: https://assets.publishing.service.gov.uk/government/uploads/system/uploads/attachment_data/file/611951/Appendix_C_ILR_2017_to_2018_v1_Published_28April17.pdf 
    it "Validates AN NAA type" do
      address = Address.new("First line", "", "District", "A9 8BC")
      pcode = address.postcode
      expect( address.validate_postcode( pcode) ).to eq true
    end
    it "Validates ANN NAA type" do
      address = Address.new("First line", "", "District", "B76 5CD" )
      pcode = address.postcode
      expect( address.validate_postcode( pcode) ).to eq true
    end
    it "Validates AAN NAA type" do
      address = Address.new("First line", "", "District", "EF4 3GH" )
      pcode = address.postcode
      expect( address.validate_postcode( pcode) ).to eq true
    end
    it "Validates AANN NAA type" do
      address = Address.new("First line", "", "District", "JK43 2LM" )
      pcode = address.postcode
      expect( address.validate_postcode( pcode) ).to eq true
    end
    it "Validates ANA NAA type" do
      address = Address.new("First line", "", "District", "N4P 1RS" )
      pcode = address.postcode
      expect( address.validate_postcode( pcode) ).to eq true
    end
    it "Validates AANA NAA type" do
      address = Address.new("First line", "", "District", "TV3P 2WX" )
      pcode = address.postcode
      expect( address.validate_postcode( pcode) ).to eq true
    end
    it "Raises an error for invalid postcode" do
      expect{ Address.new("First line", "", "District", "3T W12" ) }.to raise_error( ArgumentError, "Postcode needs to be valid." )
    end
    it "Raises an error for invalid postcode" do
      expect{ Address.new("First line", "", "District", "3TT X45" ) }.to raise_error( ArgumentError, "Postcode needs to be valid." )
    end
    it "Raises an error for invalid postcode" do
      expect{ Address.new("First line", "", "District", "33T X45" ) }.to raise_error( ArgumentError, "Postcode needs to be valid." )
    end
    it "Raises an error for invalid postcode" do
      expect{ Address.new("First line", "", "District", "33TW X45" ) }.to raise_error( ArgumentError, "Postcode needs to be valid." )
    end
    it "Raises an error for invalid postcode" do
      expect{ Address.new("First line", "", "District", "3T3 X45" ) }.to raise_error( ArgumentError, "Postcode needs to be valid." )
    end
    it "Raises an error for invalid postcode" do
      expect{ Address.new("First line", "", "District", "3T3 X45" ) }.to raise_error( ArgumentError, "Postcode needs to be valid." )
    end
    it "Raises an error for invalid postcode" do
      expect{ Address.new("First line", "", "District", "34T5 X78" ) }.to raise_error( ArgumentError, "Postcode needs to be valid." )
    end
  end
end
