class AddArtistHeadshotToUser < ActiveRecord::Migration
  def change
    add_column :users, :headshot, :string
  end
end
