class RemoveCategoryFromArtworks < ActiveRecord::Migration
  def change
    remove_column :artworks, :category
  end
end
