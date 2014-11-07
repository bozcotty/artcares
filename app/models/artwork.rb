class Artwork < ActiveRecord::Base
  include PgSearch
  attr_accessible :title, :size, :medium, :price, :shipping_price, :summary,
                  :art_image_1, :art_image_2, :art_image_3, :category, :original_work

  belongs_to :user
  belongs_to :campaign

  before_validation :set_status, on: :create
  before_create :set_artwork_quantity
  after_create :stripe_amount

  multisearchable against: [:title, :summary, :category, :medium, :price]

  validates :title, :size, :medium, :shipping_price, :summary,
            :user, :campaign, :shipping_price,
            presence: true
  validates :original_work, presence:     { message: ' &nbspAll Artworks must be original to be listed on ArtCaring.' }
  validates :category, presence:     { message: ': Please select an artwork category from the list.' }
  validates :summary, length: { maximum: 300, too_long: '%{count} characters is the maximum allowed.' }
  # validates :art_image_1, presence: true
  validates :price, numericality: { greater_than: 199.99, less_than_or_equal_to: 100_000.00 }

  validates :category, inclusion: { in: ['painting', 'sculpture', 'jewelry',
                                         'photography', 'fiber/wearables', 'mixed media (2d or 3d)', 'wood', 'metal',
                                         'glass', 'ceramics', 'drawing', 'printmaking'] }
  validates :status, inclusion: { in: %w(available sold complete) }

  mount_uploader :art_image_1, ArtImageUploader
  mount_uploader :art_image_2, ArtImageUploader
  mount_uploader :art_image_3, ArtImageUploader

  def stripe_amount # converted to cents!
    ((price * 100) + (shipping_price * 100)).to_i
  end

  def set_artwork_quantity
    self.quantity = 1
  end

  def set_status
    self.status ||= 'available'
  end
end
