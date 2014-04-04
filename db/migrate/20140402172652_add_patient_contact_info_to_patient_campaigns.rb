class AddPatientContactInfoToPatientCampaigns < ActiveRecord::Migration
  def change
    add_column :patient_campaigns, :patient_street_address, :string
    add_column :patient_campaigns, :patient_unit_number, :string
    add_column :patient_campaigns, :patient_zip_code, :string
    add_column :patient_campaigns, :patient_phone_number, :string
    
  end
end

