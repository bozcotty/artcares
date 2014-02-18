class RemoveArtistYnFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :artist_yn
  end

  def down
    add_column :users, :artist_yn, :boolean
  end
end
