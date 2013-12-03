class Artwork < ActiveRecord::Base

  attr_accessible :title, :size, :medium, :price, :shipping_price, :summary,
                  :art_image_1, :art_image_2, :art_image_3

  belongs_to :artist

  mount_uploader :art_image_1, ArtImageUploader
  mount_uploader :art_image_2, ArtImageUploader
  mount_uploader :art_image_3, ArtImageUploader

end
