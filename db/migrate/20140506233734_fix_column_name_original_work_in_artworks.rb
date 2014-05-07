class FixColumnNameOriginalWorkInArtworks < ActiveRecord::Migration
  def up
    rename_column :artworks, :original_work?, :original_work
  end

  def down
  end
end
