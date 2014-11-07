class AddStatusToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :status, :string
  end
end
