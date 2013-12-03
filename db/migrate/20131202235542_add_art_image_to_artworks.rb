class AddArtImageToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :art_image_1, :string
    add_column :artworks, :art_image_2, :string
    add_column :artworks, :art_image_3, :string
  end
end
