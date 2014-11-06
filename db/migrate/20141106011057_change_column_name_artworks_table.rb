class ChangeColumnNameArtworksTable < ActiveRecord::Migration
  def up
    rename_column :artworks, :patient_campaign_id, :campaign_id
    add_index :artworks, :campaign_id
  end
end
