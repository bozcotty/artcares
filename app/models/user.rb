class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :city, :state, :art_website, 
                  :type_of_artist, :artist_statement, :email, :password, :password_confirmation, :remember_me,
                  :provider, :uid, :headshot, :street_address, :unit_number, :zip_code, :phone_number,
                  :sample_work_1, :sample_work_2, :sample_work_3, :provider, :uid


  after_create :full_name

  # sunspot
  searchable do
    text :first_name, :last_name, :city, :state, :type_of_artist, :artist_statement 
  end
  
  # validates :art_website,'url is valid', presence: true,
  # validates :email, :password, confirmation: true, presence: true
  validates :type_of_artist, presence: true, length: {maximum: 40}
  validates :artist_statement, length: { maximum: 500 }, presence: true
  validates :first_name, :last_name, :headshot, :street_address, :city, :state, :zip_code, :art_website, :phone_number, presence: true
  validates :sample_work_1, :sample_work_2, :sample_work_3, presence: true

  mount_uploader :headshot, HeadshotUploader
  mount_uploader :sample_work_1, SampleWorkUploader
  mount_uploader :sample_work_2, SampleWorkUploader
  mount_uploader :sample_work_3, SampleWorkUploader
  

  has_one :patient_campaign, dependent: :destroy
  has_many :artworks


  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where( provider: auth.provider, uid: auth.uid ).first
    # raise auth.inspect
    unless user
      pass = Devise.friendly_token[0,20]
      user = User.new( first_name: auth.extra.raw_info.first_name,
                       last_name: auth.extra.raw_info.last_name,
                       provider: auth.provider,
                       uid: auth.uid,
                       email: auth.info.email,
                       password: pass,
                       password_confirmation: pass
                      )
      user.skip_confirmation!
      user.save
    end
    user
  end
  
  ROLES = %w[member moderator admin]

  def role?(base_role)
    self.role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(self.role)
  end 

  before_create :set_member
  def set_member
    self.role ||= 'member'
  end

  def full_name
    first_name + " " + last_name
  end

end
