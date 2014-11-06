class User < ActiveRecord::Base
  include PgSearch

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :city, :state, :art_website,
                  :type_of_artist, :artist_statement, :email, :password,
                  :password_confirmation, :remember_me, :provider, :uid,
                  :headshot, :street_address, :unit_number, :zip_code,
                  :phone_number, :provider, :uid

  before_create :set_member
  after_create :full_name

  validates :email, confirmation: true
  validates :type_of_artist, presence: true, length: {maximum: 40}
  validates :artist_statement, length: { maximum: 800, too_long: "%{count} characters is the maximum allowed."}, presence: true
  validates :first_name, :last_name, :street_address, :city, :state, :zip_code, :art_website, :phone_number, presence: true
  # validates :headshot, presence: true

  multisearchable :against => [:first_name, :last_name, :type_of_artist, :city, :state]

  mount_uploader :headshot, HeadshotUploader

  has_one  :campaign, dependent: :destroy
  has_many :artworks, dependent: :destroy

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
