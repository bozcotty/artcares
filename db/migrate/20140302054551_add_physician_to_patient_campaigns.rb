class AddPhysicianToPatientCampaigns < ActiveRecord::Migration
  def change
    add_column :patient_campaigns, :physician_first_name, :string
    add_column :patient_campaigns, :physician_last_name, :string
    add_column :patient_campaigns, :physician_office_phone, :string
  end
end
