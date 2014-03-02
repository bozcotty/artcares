class AddCampaignNameToPatientCampaigns < ActiveRecord::Migration
  def change
    add_column :patient_campaigns, :campaign_name, :string
  end
end
