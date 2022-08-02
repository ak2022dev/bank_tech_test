# File: name.rb

class Name

  attr_reader :first, :middle, :last

  def initialize( first="", middle="", last="" )
    @first = first
    @middle = middle
    @last = last
  end

end

