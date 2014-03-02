class AddPatientLastNameToPatientCampaigns < ActiveRecord::Migration
  def change
    add_column :patient_campaigns, :patient_last_name, :string
  end
end
