class Category < ActiveRecord::Base
  # created this model so that updates to list of possible art categories only needs to be changed here
  
  attr_accessible :category

  belongs_to :artwork

  validates :category, inclusion: {in: ['painting', 'sculpture', 'jewelry', 'photography', 'fiber/wearables', 'mixed media (2d or 3d)', 'wood', 'metal', 'glass', 'ceramics',  'drawing', 'printmaking']}

end
