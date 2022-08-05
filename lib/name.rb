# File: name.rb

class Name

  attr_reader :first, :middle, :last

  def initialize( first, middle="", last="" )
    checkNamePresence( first, middle, last );
    @first = first.strip
    @middle = middle.strip
    @last = last.strip
  end

  def checkNamePresence( first, middle, last )
    if (first == "" || first == nil )
      raise ArgumentError.new("First name must be given")
    end
    if ((last == "" || last == nil))
      if((middle != "" && middle != nil ))
        raise ArgumentError.new("Middle name only allowed when first and last are both given")
      end
    end
  end 
  
  def self.valid_first_name?( name )
    # Allows names like "Mary-Sue"
    ((name =~ /^[A-Z][a-z]*(-[A-z][a-z]*)*$/) == 0) ? true : false 
  end

  def self.valid_last_name?( name )
    # Currently rules for last name same as for first name
    self.valid_first_name?(name)
  end

  def self.valid_mid_name?( name )
    # Allows names like "Patrick Smith-Jones"
    ((name =~ /^[A-Z][a-z]*(-[A-z][a-z]*)*([ ][A-Z][a-z]*(-[A-Z][a-z]*)*)*$/) == 0) ? true : false 
  end


end

