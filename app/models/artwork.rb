class Artwork < ActiveRecord::Base

  attr_accessible :title, :size, :medium, :price, :shipping_price, :summary, :art_image_1, :art_image_2, :art_image_3, :category, :original_work 


  # because created a category model (took category out of artwork model):
  has_one :category

  belongs_to :user
  belongs_to :patient_campaign
  # validates user.id == patient_campaign.user.id

  before_validation :set_status, on: :create
  
  # set each artwork quantity to 1, decrements to 0 upon sale in artworks-buy controller
  before_create :set_artwork_quantity

  after_create :stripe_amount
    
  # before_save :normalize_category

  #pgsearch
  include PgSearch
  multisearchable :against => [:title, :summary, :category, :medium, :price]


  validates :title, :size, :medium, :price, :shipping_price, :summary, :category, presence: true
  validates :price, numericality: { greater_than: 199.99, less_than_or_equal_to: 100000.00 }
  validates_presence_of :original_work, :message => " &nbspAll Artworks must be original to be listed on ArtCaring."
  validates_presence_of :category, :message => ": Please select an artwork category from the list."
  validates :shipping_price, presence: true
  validates :summary, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed."}
  validates :art_image_1, presence: true
  validates :user, presence: true
  validates :patient_campaign, presence: true
  
  validates :status, inclusion: {in: %w(available sold complete)}


  mount_uploader :art_image_1, ArtImageUploader
  mount_uploader :art_image_2, ArtImageUploader
  mount_uploader :art_image_3, ArtImageUploader



  def stripe_amount
    # converted to cents!
    ((price*100) + (shipping_price*100)).to_i
  end

  # def normalize_category
  #   self.category.downcase!
  # end

  def set_artwork_quantity
    self.quantity = 1
  end

  def set_status
    self.status ||= 'available'
  end

end
