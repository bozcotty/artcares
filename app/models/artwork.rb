class Artwork < ActiveRecord::Base

  attr_accessible :title, :size, :medium, :price, :shipping_price, :summary,
                  :art_image_1, :art_image_2, :art_image_3

  belongs_to :user
  # belongs_to :patient_campaign
  # validates user.id == patient_campaign.user.id

  mount_uploader :art_image_1, ArtImageUploader
  mount_uploader :art_image_2, ArtImageUploader
  mount_uploader :art_image_3, ArtImageUploader

end
