class AddPatientFirstNameToPatientCampaigns < ActiveRecord::Migration
  def change
    add_column :patient_campaigns, :patient_first_name, :string
  end
end
