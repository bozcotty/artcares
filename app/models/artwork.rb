class Artwork < ActiveRecord::Base

  attr_accessible :title, :size, :medium, :price, :shipping_price, :summary, :art_image_1, :art_image_2, :art_image_3, :category, :original_work, :quantity

  belongs_to :user
  belongs_to :patient_campaign
  # validates user.id == patient_campaign.user.id

  # before_create :set_status

  after_create :stripe_amount
  after_create :set_artwork_quantity
  # set each artwork quantity to 1, decrements to 0 upon sale in artworks-buy controller
  
  before_save :normalize_category

  #pgsearch
  include PgSearch
  multisearchable :against => [:title, :summary, :category, :medium, :price]


  validates :title, :size, :medium, :price, :shipping_price, :summary, :category, presence: true
  validates :price, numericality: { greater_than: 99.99, less_than_or_equal_to: 25000.00 }
  validates :original_work, presence: true
  validates :shipping_price, presence: true
  validates :summary, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed."}
  validates :art_image_1, presence: true
  validates :user, presence: true
  validates :patient_campaign, presence: true
  validates :category, inclusion: {in: ['Painting', 'Sculpture', 'Jewelry', 'Photography', 'Fiber/Wearables', 'Mixed Media (2D or 3D)', 'Wood', 'Metal', 'Glass', 'Ceramics',  'Drawing', 'Printmaking']}
  # validates :status, inclusion: {in: %w(available sold finalized)}


  mount_uploader :art_image_1, ArtImageUploader
  mount_uploader :art_image_2, ArtImageUploader
  mount_uploader :art_image_3, ArtImageUploader



  def stripe_amount
    # converted to cents!
    ((price*100) + (shipping_price*100)).to_i
  end

  def normalize_category
    self.category.downcase!
  end

  def set_artwork_quantity
    self.quantity = 1
  end


  # def set_status
  #   self.status = 'available'
  # end

end
