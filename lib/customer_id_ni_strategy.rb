# File: customer_id_ni_strategy.rb

require 'customer_id_strategy'

class CustomerIdNIStrategy < CustomerIdStrategy

  # Default taken as an example of valid NI number from UK
  # government website https://www.gov.uk/hmrc-internal-manuals/national-insurance-manual/nim39110
  
  DEFAULT_NI = "QQ 12 34 56 A"  

  def initialize( ni_num = DEFAULT_NI )
    @ni_num = ni_num if CustomerIdNIStrategy.valid_ni_num?( ni_num )
  end

  def provide_id
    @ni_num
  end

  def self.valid_ni_num?( ni_num )
    raise ArgumentError.new( "Incorrect format for NI number" ) unless ni_num =~ /^[A-Z][A-Z][ ][0-9][0-9][ ][0-9][0-9][ ][0-9][0-9][ ][A-Z]$/
    true
  end

end
