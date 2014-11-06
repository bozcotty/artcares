class AddPatientCampaignIdToArtworks < ActiveRecord::Migration
  def change
    add_column :artworks, :patient_campaign_id, :integer
  end
end
