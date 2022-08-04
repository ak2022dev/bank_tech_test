# File: name_spec.rb

require 'name'

RSpec.describe Name do
  context "It initialises with blank values by default" do
    it "Does not accept a name without a given first name" do
      expect{Name.new(nil)}.to raise_error( ArgumentError, "First name must be given")
    end
    it "Does not accept a name without a given first name" do
      expect{Name.new("")}.to raise_error( ArgumentError, "First name must be given")
    end
    it "Initialises with blank middle names" do
      name = Name.new("First")
      expect(name.middle).to eq ""
    end
    it "Initialises with blank last name" do
      name = Name.new("First")
      expect(name.last).to eq ""
    end
  end
  context "It initialises with arguments passed to it" do
    it "Initialises with the first name passed to it" do
      name = Name.new( "First", "Middle", "Last" )
      expect(name.first).to eq "First"
    end
    it "Initialises with the middle name passed to it" do
      name = Name.new( "First", "Middle", "Last" )
      expect(name.middle).to eq "Middle"
    end
    it "Initialises with the last name passed to it" do
      name = Name.new( "First", "Middle", "Last" )
      expect(name.last).to eq "Last"
    end
  end
  context "It tests arguments passed to it begin with capital letter" do
    it "Checks first name starts with capital letter" do
      name = Name.new( "First", "Middle", "Last" )
      first_letter = name.first[0]
      is_capitalised = ( first_letter.upcase == first_letter )
      expect(is_capitalised).to eq true
    end
    it "Checks middle name starts with capital letter" do
      name = Name.new( "First", "Middle", "Last" )
      first_letter = name.middle[0]
      is_capitalised = ( first_letter.upcase == first_letter )
      expect(is_capitalised).to eq true
    end
    it "Checks last name starts with capital letter" do
      name = Name.new( "First", "Middle", "Last" )
      first_letter = name.last[0]
      is_capitalised = ( first_letter.upcase == first_letter )
      expect(is_capitalised).to eq true
    end
  end
  context "It tests arguments passed to it are stripped of spaces at start and end" do
    it "Checks first name is stripped of spaces at start and end" do
      name = Name.new( "  First  ", "  Middle  ", "  Last  " )
      first_letter = name.first[0]
      last_letter = name.first[-1]
      expect(first_letter).to eq "F"
      expect(last_letter).to eq "t"
    end
    it "Checks middle name is stripped of spaces at start and end" do
      name = Name.new( "  First  ", "  Middle  ", "  Last  " )
      first_letter = name.middle[0]
      last_letter = name.middle[-1]
      expect(first_letter).to eq "M"
      expect(last_letter).to eq "e"
    end
    it "Checks last name is stripped of spaces at start and end" do
      name = Name.new( "  First  ", "  Middle  ", "  Last  " )
      first_letter = name.last[0]
      last_letter = name.last[-1]
      expect(first_letter).to eq "L"
      expect(last_letter).to eq "t"
    end
  end
  context "It tests only expected characters in name sequences" do
    it "Checks first name starts with capital letter and is valid if remaining are alphabet characters " do
      name = Name.new( "First", "Middle", "Last" )
      first_name = name.first
      expect(Name.valid_first_name?(first_name)).to eq true
    end
    it "Checks last name starts with capital letter and is valid if remaining are only alphabet characters " do
      name = Name.new( "First", "Middle", "Last" )
      last_name = name.last
      expect(Name.valid_last_name?(last_name)).to eq true
    end
      it "Checks first name starts with capital letter and has valid combinations of hyphen and other characters " do
        name = Name.new( "First-Another-First", "Middle", "Last" )
        first_name = name.first
        expect(Name.valid_first_name?(first_name)).to eq true
     end
     it "Checks last name starts with capital letter and has valid combinations of hyphen and other icharacters " do
       name = Name.new( "First", "Middle", "Last-Another-Last" )
       last_name = name.last
       expect(Name.valid_last_name?(last_name)).to eq true
     end
     it "Checks middle name is similar to first/last name but allows combination of a sequence separated by a space" do
       name = Name.new( "First", "Middle-Second-Third Fourth-Fifth-Sixth Seventh-Eighth-Ninth", "Last" )
       mid_name = name.middle
       expect(Name.valid_mid_name?(mid_name)).to eq true
     end
     it "Rejects first name if it contains unexpected characters" do
       name = Name.new( "Fir_st", "Middle-Second-Third Fourth-Fifth-Sixth Seventh-Eighth-Ninth", "Last" )
       first_name = name.first
       expect(Name.valid_first_name?(first_name)).to eq false
     end
     it "Rejects last name if it contains unexpected characters" do
       name = Name.new( "First", "Middle-Second-Third Fourth-Fifth-Sixth Seventh-Eighth-Ninth", "L?ast" )
       last_name = name.last
       expect(Name.valid_last_name?(last_name)).to eq false
     end
     it "Rejects middle name if it contains unexpected characters" do
       name = Name.new( "First", "Middle-Second-Third3", "Last" )
       mid_name = name.middle
       expect(Name.valid_mid_name?(mid_name)).to eq false
     end
  end
end


