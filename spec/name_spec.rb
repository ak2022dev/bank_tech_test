# File: name_spec.rb

require 'name'

RSpec.describe Name do
  context "It initialises with blank values by default" do
    it "Initialises with a blank first name" do
      name = Name.new
      expect(name.first).to eq ""
    end
    it "Initialises with blank middle names" do
      name = Name.new
      expect(name.middle).to eq ""
    end
    it "Initialises with blank last name" do
      name = Name.new
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
end

  
