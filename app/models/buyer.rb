class Buyer < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :address_line_1, :address_zip, :address_city, :address_country,
  :address_country_code, :shipping_name, :shipping_address_line_1, :shipping_address_zip, 
  :shipping_address_city, :shipping_address_state, :shipping_address_country, 
  :shipping_address_country_code 


  # validations:
  validates :name, :address_line_1, :address_zip, :address_city, :address_country,
  :address_country_code, :shipping_name, :shipping_address_line_1, :shipping_address_zip, 
  :shipping_address_city, :shipping_address_state, :shipping_address_country, 
  :shipping_address_country_code, presence: true

end
