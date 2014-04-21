class AddArtistPercentageToPatientCampaigns < ActiveRecord::Migration
  def change
    add_column :patient_campaigns, :artist_percentage, :integer
  end
end
