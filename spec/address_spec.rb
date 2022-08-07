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
               "District", "") }.to raise_error( ArgumentError, "Address fields need to be within permitted length.")
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
#      address = Address.new("First line", "Second line", "District", "AW96 3DFEDS")
#      postcode = address.postcode
#      expect( postcode ).to eq nil
      expect { Address.new("First line", "Second line", "District", "AW96 3DFEDS") }.to raise_error( ArgumentError, "Address fields need to be within permitted length.")
    end
    context "It checks for presence of required fields" do
      it "Checks for presence of required first line and district of address" do
        address = Address.new("First line", "", "District", "")
        add1 = address.address1
        add2 = address.address2
        dist = address.district
        pcode = address.postcode
        expect( Address.check_fields_present( add1, add2, dist, pcode ) ).to eq true
      end
      it "Detects absence of required first line and district of address" do
        expect { Address.new("", "", "", "") }.to raise_error( ArgumentError, "Address1 and District field required in every address")
      end
    end
  end
end


