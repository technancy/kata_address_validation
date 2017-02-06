class Address
  attr_reader :contact_details

  def initialize(contact_details)
    @contact_details = contact_details
  end
  
  # def house_number
  #   if address_line_1.gsub(/[a-zA-Z]/, '').strip.to_i == 0 #address1 empty of numbers
  #     if address_line_2.nil? || address_line_2.empty? #address2 empty
  #       nil
  #     elsif address_line_2 #address2 NOT empty
  #       address_line_2.gsub(/[a-zA-Z]/, '').strip.to_i
  #     end
  #   else
  #     address_line_1.gsub(/[a-zA-Z]/, '').strip.to_i #address1 with numbers
  #   end
  # end

  # def house_name
  #   if address_line_1.empty? #address1 empty
  #     raise StandardError,
  #       'Invalid House Name: Please update the customer\'s address details'  
  #   else
  #     address_line_1.split(',')[0]  #address1 containing PUNCUATION
  #   end
  # end

  # def street
  #   if !address_line_2.nil? && !address_line_2.empty? #address2 NOT empty
  #     if address_line_2.split('.')[1]
  #       [ address_line_1.gsub(/[^a-zA-Z ]/, '').strip, 
  #         address_line_2.gsub(/[^a-zA-Z ]/, '').strip
  #       ].join(' ')
  #     else
  #       contact_details.fetch('address2')
  #     end
  #   elsif address_line_2.nil? || address_line_2.empty? #address2 empty
  #     if address_line_1.split(',')[1] #address1 containing PUNCUATION
  #       address_line_1.split(',')[1].gsub(/[^a-zA-Z ]/, '').strip
  #     else
  #       address_line_1.gsub(/[^a-zA-Z ]/, '').strip
  #     end
  #   end
  # end

  # def address_line_1
  #   contact_details.fetch('address1')
  # end

  # def address_line_2
  #   contact_details.fetch('address2')
  # end
end