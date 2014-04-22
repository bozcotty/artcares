class Buyer < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :city, :state, :art_website, 
                  :type_of_artist, :artist_statement, :email, :email_confirmation, :password, :password_confirmation, :remember_me,
                  :provider, :uid, :headshot, :street_address, :unit_number, :zip_code, :phone_number


  # validates :art_website,'url is valid', presence: true,
  validates :email, :password, confirmation: true, presence: true
  validates :type_of_artist, presence: true, length: {maximum: 40}
  validates :artist_statement, length: { maximum: 500 }, presence: true
  validates :first_name, :last_name, :headshot, :street_address, :city, :state, :zip_code, :art_website, :phone_number, presence: true

end
