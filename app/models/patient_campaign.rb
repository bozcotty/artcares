class PatientCampaign < ActiveRecord::Base
  attr_accessible :campaign_name, :artist_relationship_to_patient, :patient_city, :patient_diagnosis, :patient_first_name, :patient_last_name, :patient_state, 
                  :patient_story, :patient_image_1

  belongs_to :user
  has_many :artworks

  mount_uploader :patient_image_1, PatientImageUploader

  validates :artist_relationship_to_patient, presence: true, length: {maximum: 30}
  validates :patient_city, presence: true
  validates :patient_state, presence: true
  validates :patient_story, presence: true
  validates :patient_image_1, presence: true
  validates :patient_diagnosis, presence: true
  
end
