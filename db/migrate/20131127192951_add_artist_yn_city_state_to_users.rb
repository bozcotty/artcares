class AddArtistYnCityStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :artist_yn, :boolean
    add_column :users, :city, :string
    add_column :users, :state, :string
  end
end
