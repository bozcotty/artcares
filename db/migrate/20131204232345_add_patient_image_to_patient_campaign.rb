class AddPatientImageToPatientCampaign < ActiveRecord::Migration
  def change
    add_column :patient_campaigns, :patient_image_1, :string
  end
end
