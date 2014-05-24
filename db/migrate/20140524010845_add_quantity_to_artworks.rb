class AddQuantityToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :quantity, :integer
  end
end
