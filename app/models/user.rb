class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :city, :state, :art_website,
                  :type_of_artist, :artist_statement, :email, :password, :password_confirmation, :remember_me,
                  :provider, :uid, :headshot, :street_address, :unit_number, :zip_code, :phone_number,
                  :provider, :uid


  after_create :full_name

  # pgsearch
  include PgSearch
  multisearchable :against => [:first_name, :last_name, :type_of_artist, :city, :state]

  #validates :art_website,'url is valid', presence: true,
  validates :email, confirmation: true
  validates :type_of_artist, presence: true, length: {maximum: 40}
  validates :artist_statement, length: { maximum: 800, too_long: "%{count} characters is the maximum allowed."}, presence: true
  validates :first_name, :last_name, :street_address, :city, :state, :zip_code, :art_website, :phone_number, presence: true
  # validates :headshot, presence: true

  before_create :set_member

  mount_uploader :headshot, HeadshotUploader

  has_one :campaign, dependent: :destroy
  has_many :artworks, dependent: :destroy


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

  ROLES = %w[member admin]

  def role?(base_role)
    self.role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(self.role)
  end

  def full_name
    first_name + " " + last_name
  end

  private

  def set_member
    self.role ||= 'member'
  end

end
