# File: name.rb

class Name

  attr_reader :first, :middle, :last

  def initialize( first="", middle="", last="" )
    @first = first.strip
    @middle = middle.strip
    @last = last.strip
  end

  def self.valid_first_name?( name )
    ((name =~ /^[A-Z][a-z]*(-[A-z][a-z]*)*$/) == 0) ? true : false 
  end

  def self.valid_last_name?( name )
    # Currently rules for last name same as for first name
    self.valid_first_name?(name)
  end

end

