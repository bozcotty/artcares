class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :city, :state, :art_website, 
                  :type_of_artist, :artist_statement, :email, :password, :password_confirmation, :remember_me,
                  :provider, :uid, :headshot, :street_address, :unit_number, :zip_code, :phone_number,
                  :sample_work_1, :sample_work_2, :sample_work_3, :sample_work_4


  after_create :full_name

  # sunspot
  searchable do
    text :first_name, :last_name, :city, :state, :type_of_artist, :artist_statement 
  end
  
  # validates :art_website,'url is valid', presence: true,
  validates :email, :password, confirmation: true, presence: true
  validates :type_of_artist, presence: true, length: {maximum: 40}
  validates :artist_statement, length: { maximum: 500 }, presence: true
  validates :first_name, :last_name, :headshot, :street_address, :city, :state, :zip_code, :art_website, :phone_number, presence: true
  validates :sample_work_1, :sample_work_2, :sample_work_3, :sample_work_4, presence: true

  mount_uploader :headshot, HeadshotUploader
  mount_uploader :sample_work_1, SampleWorkUploader
  mount_uploader :sample_work_2, SampleWorkUploader
  mount_uploader :sample_work_3, SampleWorkUploader
  mount_uploader :sample_work_4, SampleWorkUploader

  has_one :patient_campaign, dependent: :destroy
  has_many :artworks
  
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
