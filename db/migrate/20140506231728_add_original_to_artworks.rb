class AddOriginalToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :original_work?, :boolean
  end
end
