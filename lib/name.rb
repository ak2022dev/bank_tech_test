# File: name.rb

class Name

  attr_reader :first, :middle, :last

  def initialize( first="", middle="", last="" )
    @first = first.strip
    @middle = middle.strip
    @last = last.strip
  end

end

