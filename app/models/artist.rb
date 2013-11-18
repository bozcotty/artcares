class Artist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # #devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible   :first_name, :last_name, :phone_num, :street, :city, :state, :zip_code,
                    :email, :password, :password_confirmation, :remember_me, 
                    :art_website, :type_of_artist, :artist_statement, 
  #                 :provider, :uid

  # has_many :artworks
  # has_many :patient_campaigns, through: :artworks 

  # def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
end
