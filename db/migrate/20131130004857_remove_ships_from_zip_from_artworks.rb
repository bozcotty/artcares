class RemoveShipsFromZipFromArtworks < ActiveRecord::Migration
  def up
    remove_column :artworks, :ships_from_zip
  end

  def down
    add_column :artworks, :ships_from_zip, :integer
  end
end
