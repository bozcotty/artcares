class DropColumnsFromPatientCampaign < ActiveRecord::Migration
  def up
    remove_column :campaigns, :physician_first_name
    remove_column :campaigns, :physician_last_name
    remove_column :campaigns, :physician_office_phone
  end

  def down
    add_column :campaigns, :physician_first_name, :string
    add_column :campaigns, :physician_last_name, :string
    add_column :campaigns, :physician_office_phone, :string
  end
end
