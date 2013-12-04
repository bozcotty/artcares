class PatientCampaign < ActiveRecord::Base
  attr_accessible :artist_relationship_to_patient, :patient_city, :patient_diagnosis, :patient_name, :patient_state, :patient_story

  belongs_to :artist
  has_many :artworks
end
