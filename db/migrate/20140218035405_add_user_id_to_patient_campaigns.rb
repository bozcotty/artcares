class AddUserIdToPatientCampaigns < ActiveRecord::Migration
  def change
    add_column :patient_campaigns, :user_id, :integer
  end
end
