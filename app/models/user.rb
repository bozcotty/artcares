class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :city, :state, :art_website, 
                  :type_of_artist, :artist_statement, :email, :password, :password_confirmation, :remember_me,
                  :provider, :uid, :artist_yn

  validates :artist_yn, inclusion: [true, false]
  # if an artist:
  validates :first_name, presence: true, if: :is_an_artist?
  validates :last_name, presence: true, if: :is_an_artist?

  # validates :art_website,'url is valid', presence: true, if: :is_an_artist

  validates :type_of_artist, presence: true, length: {maximum: 40}, if: :is_an_artist? 
  validates :artist_statement, length: { maximum: 500 }, presence: true, if: :is_an_artist?

  has_many :artworks
  
  
  def is_an_artist?
    self.artist_yn == true
  end
  

end
