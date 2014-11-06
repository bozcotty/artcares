class RenameTablePatientCampaigns < ActiveRecord::Migration
  def up
    rename_table :patient_campaigns, :campaigns
  end

  def down
    rename_table :campaigns, patient_campaigns
  end
end
