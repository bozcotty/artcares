class RemovePatientNameFromPatientCampaigns < ActiveRecord::Migration
  def up
    remove_column :patient_campaigns, :patient_name
  end

  def down
    add_column :patient_campaigns, :patient_name, :string
  end
end
