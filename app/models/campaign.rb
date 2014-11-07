class Campaign < ActiveRecord::Base
  include PgSearch
  attr_accessible :campaign_name, :artist_relationship_to_patient, :patient_city,
                  :patient_diagnosis, :patient_first_name, :patient_last_name,
                  :patient_state, :patient_story, :patient_image_1,
                  :patient_street_address, :patient_unit_number, :patient_zip_code,
                  :patient_phone_number, :artist_percentage

  belongs_to :user
  has_many :artworks, dependent: :destroy

  after_create :full_name

  multisearchable against: [:campaign_name, :patient_diagnosis, :patient_city,
                            :patient_state, :patient_first_name, :patient_last_name]

  mount_uploader :patient_image_1, PatientImageUploader

  validates :artist_relationship_to_patient, presence: true, length: { maximum: 30 }
  validates :campaign_name, presence: true, length: { maximum: 60 }
  validates :user, :patient_city, :patient_state, :patient_story, :patient_diagnosis,
            :patient_zip_code, :patient_phone_number, presence: true
  # validates :patient_image_1, presence: true

  validates :user_id, uniqueness: true

  validates :artist_percentage, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 30 }

  def full_name
    patient_first_name + ' ' + patient_last_name
  end
end
