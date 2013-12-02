class Artwork < ActiveRecord::Base

  attr_accessible :title, :size, :medium, :price, :shipping_price, :summary


  belongs_to :artist

end
