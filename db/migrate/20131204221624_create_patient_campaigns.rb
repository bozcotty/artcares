class CreatePatientCampaigns < ActiveRecord::Migration
  def change
    create_table :patient_campaigns do |t|
      t.string :patient_name
      t.string :patient_city
      t.string :patient_state
      t.string :artist_relationship_to_patient
      t.string :patient_diagnosis
      t.text :patient_story

      t.timestamps
    end
  end
end
