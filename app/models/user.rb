class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :city, :state, :art_website, 
                  :type_of_artist, :artist_statement, :email, :password, :password_confirmation, :remember_me,
                  :provider, :uid, :artist_yn

# if an artist (radio button- yes), then:
  validates :first_name, presence: true, if artist_yn = true
  validates :last_name, presence: true
  validates :art_website,'url is valid', presence: true
  validates :type_of_artist, presence: true, length: {maximum: 40} 
  # validates :artist_statement, length: { maximum: 500 }, presence: true
  ## validates :artist_yn, ---- one or other button has been selected
  

end
