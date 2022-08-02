# File: name_spec.rb

require 'name'

RSpec.describe Name do
  context "It initialises with blank values by default" do
    it "Initialises with a blank first name" do
      name = Name.new
      expect(name.first).to eq ""
    end
  end
end

