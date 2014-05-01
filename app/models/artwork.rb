class Artwork < ActiveRecord::Base

  attr_accessible :title, :size, :medium, :price, :shipping_price, :summary,
                  :art_image_1, :art_image_2, :art_image_3, :category

  belongs_to :user
  belongs_to :patient_campaign
  # validates user.id == patient_campaign.user.id

  after_create :stripe_amount

  validates :title, :size, :medium, :price, :shipping_price, :summary, :category, presence: true
  validates :price, numericality: { greater_than: 99.99, less_than_or_equal_to: 25000.00 }
  validates :shipping_price, presence: true
  validates :summary, length: { maximum: 300, too_long: "%{count} characters is the maximum allowed."}
  validates :art_image_1, presence: true
  validates :user, presence: true
  validates :patient_campaign, presence: true

  scope :oil, where(:medium == "oil")
  

  mount_uploader :art_image_1, ArtImageUploader
  mount_uploader :art_image_2, ArtImageUploader
  mount_uploader :art_image_3, ArtImageUploader

  def stripe_amount
    # converted to cents!
    ((price*100) + (shipping_price*100)).to_i
  end

end
